# frozen_string_literal: true

class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request
  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])
    if command.present?
      render json: { auth_token: command }
    else
      render json: { error: 'unauthorized request' }, status: :unauthorized
    end
  end
end
