class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :dare

  validates :amount, presence: true
  validates :user, presence: true
  validates :dare, presence: true
end
