class SessionsController < ApplicationController
  before_action :authenticate, only: :destroy

  def create
    u = User.find_by(email: params[:email])

   if u && u.authenticate(params[:password])
     u.regenerate_auth_token
     render json: u
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
