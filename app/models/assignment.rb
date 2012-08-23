class Assignment < ActiveRecord::Base
  attr_accessible :title, :course_id, :due_date, :release_date
  has_many :questions
  belongs_to :course

  def is_open?
    return self.release_date < Time.now
  end

  def is_active?
    return ((self.release_date < Time.now) and (self.due_date > Time.now))
  end
end
