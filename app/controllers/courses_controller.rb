class CoursesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @courses = Course.all
  end


  def show
    @course = Course.find(params[:id])
    @lessons = @course.lessons
  end

  def subscribe
    current_user.courses << Course.find(params[:course_id])
    render text: "OK", status: "200"
  end
end
