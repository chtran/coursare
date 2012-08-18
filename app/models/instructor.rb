class Instructor < ActiveRecord::Base
  attr_accessible :name, :school
  has_many :courses
end
