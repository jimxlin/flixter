class CoursesController < ApplicationController
  def index
    @courses = Course.order(:title).all
  end

  def show
    @course = Course.find(params[:id])
  end
end
