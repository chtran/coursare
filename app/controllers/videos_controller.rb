class VideosController < ApplicationController
  before_filter :authenticate_user!
  def quizzes
    @video = Video.find(params[:id])
    data = @video.quizzes.collect {|q| q.id}
    render json: data
  end
end
