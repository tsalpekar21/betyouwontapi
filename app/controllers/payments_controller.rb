class PaymentsController < ApplicationController
  before_action :authenticate

  def create
    if p = Payments.create(user_id: params[:user_id], dare_id: params[:dare_id], amount: params[:amount])
      render json: p
    else
      render json: 'error', status: 'error man'
    end
  end
end
