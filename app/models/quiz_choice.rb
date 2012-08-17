class QuizChoice < ActiveRecord::Base
  attr_accessible :choice_letter, :content, :correct, :quiz_id
  belongs_to :quiz
end
