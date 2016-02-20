class SessionsController < ApplicationController
  before_action :authenticate, only: :destroy

  def create
    u = User.find_by(email: params[:email])

   if u && u.authenticate(params[:password])
     token = u.regenerate_auth_token
     u.update_column(:token, token)
     render json: {email: u.email, token: u.token, name: u.name}
    else
      render json: {error: "Login credentials are invalid"}, status: :unauthorized
   end
  end

  def destroy
    token = @current_user.regenerate_auth_token
    @current_user.update_column(:token, token)
    if token
      render json: {success: true}
    else
      render json: @current_user.errors, status: :unprocessable_entity
    end
  end
end
