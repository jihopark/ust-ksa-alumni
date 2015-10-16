class JobPostsController < ApplicationController
  def create
    @job_post = JobPost.new
    @job_post.admin_user_id = current_user.id
    @job_post.published = false
    begin
    	code = SecureRandom.hex(5)
    end while JobPost.exists?(code: code)
    @job_post.code = code

    if @job_post.save
      flash[:notice] = "Job Post Created. Please fill in the details"
      redirect_to edit_job_post_path(@job_post)
    else
      flash[:error] = "Failed To Create Job Post"
      redirect_to admin_path
    end
  end

  def preferences
    @job_post = JobPost.find_by_id(params[:id])
    major_matches = User.joins(:majors).where("major_id IN (?)", @job_post.major_preferences.all.map { |e| e.id })
    experienced_industries_matches = User.joins(:experienced_industries).where("industry_id IN (?)", @job_post.industry_preferences.all.map { |e| e.id })
    interested_industries_matches = User.joins(:interested_industries).where("industry_id IN (?)", @job_post.industry_preferences.all.map { |e| e.id })

    unless @job_post.nil?
      render json: {"majors" => @job_post.major_preferences,
        "industries" => @job_post.industry_preferences,
        "major_matches" => major_matches.count,
        "experienced_industries_matches" => experienced_industries_matches.count,
        "interested_industries_matches" => interested_industries_matches.count,
        "total_matches" => (major_matches|experienced_industries_matches|interested_industries_matches).count}
    else
      render :json => false
    end
  end

  def update_preferences
    @job_post = JobPost.find_by_id(params[:id])
    @selected_majors = params[:majors]
    @selected_industries = params[:industries]

    unless @job_post.nil?
      unless @selected_majors.nil? || @selected_majors.empty?
        majors = []
        @selected_majors.each do |major|
          majors << Major.find(major["id"])
        end
        @job_post.major_preferences = majors
      else
        @job_post.major_preferences = []
      end

      unless @selected_industries.nil? || @selected_industries.empty?
        industries = []
        @selected_industries.each do |industry|
          industries << Industry.find(industry["id"])
        end
        @job_post.industry_preferences = industries
      else
        @job_post.industry_preferences = []
      end
      render :json => true
      return ;
    end
    render :json => false

  end

  def edit
    @post = JobPost.find_by_code(params[:code])
    if @post.nil?
      flash[:error] = "Wrong URL. Please try again"
      redirect_to root_path
    end
  end

  def index
  end

  def destroy
  end
end
