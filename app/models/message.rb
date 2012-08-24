class Message < ActiveRecord::Base
  attr_accessible :content, :receiver_id, :sender_id
  def sender
    User.find(self.sender_id)
  end

  def receiver
    User.find(self.receiver_id)
  end
end
