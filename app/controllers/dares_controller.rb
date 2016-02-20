class DaresController < ApplicationController
  before_action :authenticate

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
    render json: d
  end


end
