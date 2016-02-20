require 'httparty'
class PaymentsController < ApplicationController
  before_action :authenticate

  def create
    if co_payment && p = Payment.create(user_id: @current_user.id, dare_id: params[:dare_id], amount: params[:amount])
      render json: p.to_json({:include => { :user => { :except => [:password_digest, :token] }, :dare => {} }})
    else
      render json: 'error', status: 'error man'
    end
  end


private
  
  def co_payment

    #### No API so fake stuff here
  end
end
