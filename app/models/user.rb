class User < ActiveRecord::Base
  before_create :generate_token
  before_save { email.downcase!}

  has_many :payments
  
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true
  validates :password, presence: true

  has_secure_password
  has_many :dares

  def generate_token
    self.token = SecureRandom.hex
  end

  def regenerate_auth_token
    begin
      self.token = SecureRandom.hex
    end while self.class.exists?(token: token)
    token
  end

end
