class Attempt < ActiveRecord::Base
  attr_accessible :assignment_id, :user_id
  belongs_to :assignment
  belongs_to :user
  has_many :answers
end
