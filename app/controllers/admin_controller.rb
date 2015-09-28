class AdminController < ApplicationController
  before_filter :check_admin

  def index
    @admin_users = User.where(admin:true).order("id")
    @users = User.all.order("id")
  end

  def destroy
    user = User.find_by_id(params[:user])
    user.update_attribute :admin, false
    flash[:notice] = "Removed user from admin"
    redirect_to admin_path
  end

  def create
    user = User.find_by_id(params[:user_id])
    unless user.nil?
      user.update_attribute :admin, true
      flash[:notice] = "Add user from admin"
    else
      flash[:error] = "Wrong ID"
    end
    redirect_to admin_path
  end

  private

  def check_admin
    unless current_user.try(:admin?)
      redirect_to root_path
    end
  end
end
