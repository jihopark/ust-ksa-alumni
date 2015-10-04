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

  def edit
    @post = JobPost.find(params[:id])
  end

  def index
  end

  def destroy
  end
end
