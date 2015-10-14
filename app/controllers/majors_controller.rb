class MajorsController < ApplicationController

  def index
    render json: Major.all
  end
end
