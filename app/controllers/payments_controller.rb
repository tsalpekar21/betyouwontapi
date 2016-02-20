class PaymentsController < ApplicationController
  before_action :authenticate

  def create
    if p = Payment.create(user_id: @current_user.id, dare_id: params[:dare_id], amount: params[:amount])
      render json: p
    else
      render json: 'error', status: 'error man'
    end
  end
end
