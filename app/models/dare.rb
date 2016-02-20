class Dare < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :payments
end
