class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:id] = user.id
      render json: UserSerializer.new(user)
    else
      render json: {error: "Incorrect Email/Password, Please try again"}, status: 400
    end
  end
end
