class Assignment < ActiveRecord::Base
  attr_accessible :lesson_id, :title
  has_many :questions
end
