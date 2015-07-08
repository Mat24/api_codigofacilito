class Api::V1::UsersController < ApplicationController
  def create
    # params= { auth: { provider: 'facebook', uid: 'dawdadwd457'} }
    @user = User.from_omniauth(params[:auth])
    @token = @user.tokens.create
    render "api/v1/users/show"
  end
end
