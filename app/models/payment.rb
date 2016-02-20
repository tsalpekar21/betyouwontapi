class Payment < ActiveRecord::Base
  belongs_to :user

  validates :amount, presence: true
  validates :user, presence: true
  validates :dare, presence: true
end
