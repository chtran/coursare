class VideosController < ApplicationController
  def quizzes
    @video = Video.find(params[:id])
    data = @video.quizzes.collect do |quiz| {
      quiz: quiz,
      choices: quiz.quiz_choices.collect do |quiz_choice| {
        id: quiz_choice.id,
        choice_letter: quiz_choice.choice_letter,
        content: quiz_choice.content
      }
      end
    }
    end

    render json: data
  end
end
