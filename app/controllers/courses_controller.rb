class CoursesController < ApplicationController
  def index
    @courses = Course.order(:title).all
  end

  def show
  end
end
