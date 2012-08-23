class AssignmentsController < ApplicationController
  def index
    course_id = params[:course_id]
    course = Course.find(course_id)
    @assignments = course.assignments
  end

  def attempt
    @assignment = Assignment.find(params[:id])
  end
end
