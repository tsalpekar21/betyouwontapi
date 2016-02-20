class UsersController < ApplicationController

  def create
    if u = User.create(name: params[:name], email: params[:email], password: params[:password])
      render json: {name: u.name, email: u.email, token: u.token}
    else
      render json: u.errors, status: 'Cant do it'
    end
  end
end
