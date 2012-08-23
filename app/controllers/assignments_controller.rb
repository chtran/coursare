class AssignmentsController < ApplicationController
  def index
    course_id = params[:course_id]
    course = Course.find(course_id)
    @assignments = course.assignments
  end

  def attempt
    @assignment = Assignment.find(params[:id])
    gon.assignment_id = @assignment.id
    gon.questions = @assignment.questions.collect {|q| q.id}
  end

  def submit
    attempt = current_user.attempts.create! assignment_id: params[:assignment_id] 
    question_data = params[:question_data]
    question_data.each do |q|
      attempt.answers.create! question_id: q[1][:question_id], choice_id: q[1][:choice_id]
    end
    render text: "OK", status: "200"
  end
end
