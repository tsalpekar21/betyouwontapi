class SessionsController < ApplicationController
  before_action :authenticate, only: :destroy

  def create
    u = User.find_by(token: params[:token])

   if u && u.authenticate(params[:password])
     render json: {name: u.name, email: u.email}
    else
      render json: {error: "Login credentials are invalid"}, status: :unauthorized
   end
  end

  def destroy
    @current_user.regenerate_auth_token
    if @current_user.save
      head :no_content
    else
      render json: @current_user.errors, status: :unprocessable_entity
    end
  end
end
