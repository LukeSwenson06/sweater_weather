class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      new_user = user.update(api_key: SecureRandom.hex)
      render json: UserSerializer.new(user), status: 201
    elsif params[:password] != params[:password_confirmation]
      render json: {error: user.errors.full_messages.to_sentence}, status: 400
    elsif User.find_by(email: user.email)
      render json: {error: user.errors.full_messages.to_sentence}, status: 400
    else
      render json: {error: user.errors.full_messages.to_sentence}, status: 400
    end
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
