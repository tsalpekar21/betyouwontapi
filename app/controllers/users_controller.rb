class UsersController < ApplicationController
  before_action :authenticate, except: :create

  def create
    if u = User.create(name: params[:name], email: params[:email], password: params[:password])
      render json: {id: u.id, name: u.name, email: u.email, token: u.token}
    else
      render json: u.errors, status: 'Cant do it'
    end
  end

  def get
    render json: { bmax: 'BMAX IS A NIG' }
  end

  def payments
    if p = current_user.payments
      render json: p
    else 
      render json: 'error', status: 'crap'
    end
  end

end
