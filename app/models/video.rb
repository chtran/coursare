class Video < ActiveRecord::Base
  attr_accessible :url, :title
  has_many :quizzes
  def quizzes_id
    self.quizzes.collect {|q| q.id}
  end
end
