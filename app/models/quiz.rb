class Quiz < ActiveRecord::Base
  attr_accessible :prompt, :video_id
  has_many :quiz_choices
end
