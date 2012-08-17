class History < ActiveRecord::Base
  attr_accessible :quiz_choice_id, :quiz_id, :user_id
end
