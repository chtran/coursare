class CoursesController < ApplicationController
  def show
    course = Course.find(params[:course_id])
  end
end
