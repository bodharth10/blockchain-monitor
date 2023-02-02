# frozen_string_literal: true

class AuthenticateUser < ApplicationService
  def initialize(email, password)
    @email = email
    @password = password
    @errors = {}
  end

  def call(*_args)
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password

  def user
    user = User.find_by_email(email)
    return user if user&.authenticate(password)

    @errors.merge!(user_authentication: 'invalid credentials')
    nil
  end
end
