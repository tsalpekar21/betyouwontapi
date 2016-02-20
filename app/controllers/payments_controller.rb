require 'httparty'
class PaymentsController < ApplicationController
  before_action :authenticate
  @@co_key = '123'
  @@merchant_id = 123

  def create
    if co_payment && p = Payment.create(user_id: @current_user.id, dare_id: params[:dare_id], amount: params[:amount])
      render json: p.to_json({:include => { :user => { :except => [:password_digest, :token] }, :dare => {} }})
    else
      render json: 'error', status: 'error man'
    end
  end


private
  
  def co_payment
    return false unless @current_user.account

    body = {amount: params[:amount].to_f,
      description: "Funding a challenge on Bet You Wont!",
      medium: "balance",
      purchase_date: "2016-02-20",
      status: "pending"}

    req = HTTParty.post("http://api.reimaginebanking.com/accounts/123/purchases?key=#{@@co_key}",
    :body => body.to_json ,
    :headers => { 'Content-Type' => 'application/json' })

    req.code == 200
  end
end
