class Lesson < ActiveRecord::Base
  attr_accessible :course_id, :title
  belongs_to :course
  has_many :videos
end
