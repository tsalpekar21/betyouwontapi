class UsersController < ApplicationController
  before_action :authenticate, except: :create

  def create
    if u = User.create(name: params[:name], email: params[:email], password: params[:password], account: params[:account])
      render json: {id: u.id, name: u.name, email: u.email, token: u.token}
    else
      render json: u.errors, status: 'Cant do it'
    end
  end

  def show
    render json: current_user
  end

  def payments
    if p = current_user.payments
      render json: p
    else 
      render json: p.errors, status: 'crap'
    end
  end

  def update
    @current_user.update_column(:account, params[:account]) if params[:account]
    @current_user.update_column(:name, params[:name]) if params[:name]
    @current_user.update_column(:email, params[:email]) if params[:email]

    render json: {:success => true}
  end

end
