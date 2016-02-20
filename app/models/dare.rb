class Dare < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :payments

  def total_amount
    "%05.2f" % self.payments.sum(:amount).to_f  #String of amount with two decimal places
  end
end
