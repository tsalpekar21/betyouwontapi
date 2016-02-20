class User < ActiveRecord::Base
  before_create :generate_token
  before_save { email.downcase!}

  has_many :payments
  
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true
  validates :password, presence: true

  has_secure_password
  has_many :dares, class_name: 'Dare', foreign_key: 'created_by'

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
