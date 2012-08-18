class Quiz < ActiveRecord::Base
  attr_accessible :prompt, :video_id
  has_many :quiz_choices

  def correct_choice
    self.quiz_choices.where(correct: true).first
  end
end
