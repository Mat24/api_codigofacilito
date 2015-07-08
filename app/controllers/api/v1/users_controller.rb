class Api::V1::UsersController < ApplicationController
  def create
    # params= { auth: { provider: 'facebook', uid: 'dawdadwd457'} }
    if !params[:auth]
      render json: {error: "Auth param is missing"}, status: :unprocessable_entity
    else
      @user = User.from_omniauth(params[:auth])
      @token = @user.tokens.create
      render "api/v1/users/show"
    end
  end
end
