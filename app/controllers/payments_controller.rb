class PaymentsController < ApplicationController
  validates :amount, presence: true
  validates :user, presence: true
  validates :dare, presence: true
end
