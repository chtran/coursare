class Choice < ActiveRecord::Base
  attr_accessible :choice_letter, :content, :correct, :question_id
end
