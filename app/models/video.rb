class Video < ActiveRecord::Base
  attr_accessible :url, :title
  has_many :quizzes
end
