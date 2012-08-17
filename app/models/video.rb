class Video < ActiveRecord::Base
  attr_accessible :url, :title, :lesson_id
  has_many :quizzes
end
