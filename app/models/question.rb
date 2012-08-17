class Question < ActiveRecord::Base
  attr_accessible :assignment_id, :prompt
  has_many :choices
end
