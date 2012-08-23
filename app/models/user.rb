class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :oauth_token
  has_many :courses, through: :course_subscriptions
  has_many :attempts
  def self.find_for_auth(auth, signed_in_resource=nil)
    user = User.where(email: auth.info.email).first
    if !user
      user = User.create(provider:auth.provider,
                         uid:auth.uid,
                         email: auth.info.email,
                         password: Devise.friendly_token[0,20],
                         oauth_token: auth.credentials.token)
      #profile = Profile.new(first_name: auth.info.first_name,
      #                      last_name: auth.info.last_name,
      #                      image: auth.info.image)
      #profile.user = user
      #profile.save
    else
      user.update_attribute(:oauth_token, auth.credentials.token)
      #user.profile.update_attributes({
      #  image: auth.info.image,
      #})
    end
    user
  end

  def self.find_for_facebook_auth(auth, signed_in_resource=nil)
    user = User.find_for_auth(auth, signed_in_resource)
    #user.import_facebook_friends
    return user
  end

  def self.find_for_google_oauth2(auth, signed_in_resource=nil)
    User.find_for_auth(auth, signed_in_resource)
  end


  def attempt_count(assignment_id)
    return self.attempts.where(assignment_id: assignment_id).count
  end
end
