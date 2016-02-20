class DaresController < ApplicationController
  before_action :authenticate, :except => :all

  def create
    id = current_user.id
    d = Dare.create(dare: params[:dare], user_id: id, description: params[:description])
    if d
      render json: d
    else
      render json: d.errors, status: 'it didnt work' 
    end
  end

  def show
    d = Dare.find(params[:id])
    render json: d.as_json({include: {:payments => {}}, :methods => :total_amount})
  end

  def claim
    d = Dare.find(params[:id])
    d.update_column(:claimed_by, @current_user.id)
    d.update_column(:locked, true)
    render json: {status: :success}
  end

  def finish
    d = Dare.find(params[:id])
    d.update_column(:finished, true)
    render json: {status: :success, amount: d.total_amount}
  end

  def all
    d = Dare.order('created_at').where(finished: false).all#, order: "created_at DESC", conditions: {finished: false})
    render json: d
  end
  
end
