class Answer < ActiveRecord::Base
  attr_accessible :attempt_id, :choice_id, :question_id
  belongs_to :attempt
  belongs_to :question
  belongs_to :choice
end
