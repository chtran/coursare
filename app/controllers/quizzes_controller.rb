class QuizzesController < ApplicationController
  before_filter :authenticate_user!
  def confirm
    History.create user_id: current_user.id, quiz_choice_id: params[:quiz_choice_id]
    quiz_choice = QuizChoice.find(params[:quiz_choice_id])
    render json: {
      correct_id: quiz_choice.quiz.correct_choice.id,
      chosen_id: quiz_choice.id
    }
  end

  def show
    @quiz = Quiz.find(params[:id])
    render partial: "show"
  end
end
