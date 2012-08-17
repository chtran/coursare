class Course < ActiveRecord::Base
  attr_accessible :instructor_id, :subject_id, :title
  has_many :lessons
  belongs_to :instructor
  belongs_to :subject
end
