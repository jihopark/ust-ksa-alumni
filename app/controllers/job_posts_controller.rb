class JobPostsController < ApplicationController
  def update
    @job_post = JobPost.find_by_id(params[:id])
    @job_post.host_contact = params[:job_post][:host_contact]
    @job_post.host_organization = params[:job_post][:host_organization]
    @job_post.title = params[:job_post][:title]
    @job_post.description = params[:job_post][:description]
    @job_post.expire_date = Date.civil(params[:job_post]["expire_date(1i)"].to_i, params[:job_post]["expire_date(2i)"].to_i, params[:job_post]["expire_date(3i)"].to_i)
    @job_post.has_event = params[:job_post][:has_event]

    if @job_post.has_event
      @job_post.event_venue = params[:job_post][:event_venue]
      @job_post.event_time = DateTime.civil(params[:job_post]["event_time(1i)"].to_i, params[:job_post]["event_time(2i)"].to_i, params[:job_post]["event_time(3i)"].to_i, params[:job_post]["event_time(4i)"].to_i, params[:job_post]["event_time(5i)"].to_i)
    end

    if @job_post.save
      flash[:notice] = "Successfully Edited"
      if current_user.nil?
        redirect_to job_post_path
      else
        redirect_to edit_job_post_path(id: @job_post.id, code:@job_post.code)
      end
    else
      error_msg = "Could Update information.\n"
      @job_post.errors.full_messages.each do |msg|
          error_msg += "\n" + msg
      end
      flash[:error] = error_msg
      redirect_to edit_job_post_path(id: @job_post.id, code:@job_post.code)
    end
  end

  def show
    #to show non-login user that job post has been created
  end

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

    unless @job_post.nil?
      render json: {"majors" => @job_post.major_preferences,
        "industries" => @job_post.industry_preferences}
    else
      render :json => false
    end
  end

  def preferences_matches
    @job_post = JobPost.find_by_id(params[:id])
    major_matches = User.joins(:majors).where("major_id IN (?)", @job_post.major_preferences.all.map { |e| e.id })
    experienced_industries_matches = User.joins(:experienced_industries).where("industry_id IN (?)", @job_post.industry_preferences.all.map { |e| e.id })
    interested_industries_matches = User.joins(:interested_industries).where("industry_id IN (?)", @job_post.industry_preferences.all.map { |e| e.id })

    render json: {
      "major_matches" => major_matches.count,
      "experienced_industries_matches" => experienced_industries_matches.count,
      "interested_industries_matches" => interested_industries_matches.count,
      "total_matches" => (major_matches|experienced_industries_matches|interested_industries_matches).count}
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
