class User < ActiveRecord::Base
  before_create :generate_token
  before_save { email.downcase!}
  
  validates :email, uniqueness: true
  has_secure_password

  def generate_token
    self.token = SecureRandom.hex
  end

  def auth_token
    authentication_token || regenerate_auth_token
  end

  def regenerate_auth_token
    begin
      self.authentication_token = SecureRandom.hex
    end while self.class.exists?(authentication_token: authentication_token)
    authentication_token
  end

end
