class IndustriesController < ApplicationController
  def index
    render json: Industry.all.order("favorite DESC").order("id")
  end
end
