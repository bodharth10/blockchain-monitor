# frozen_string_literal: true

class AuthorizeApiRequest < ApplicationService
  def initialize(headers = {})
    @headers = headers
    @errors = {}
  end

  def call(*_args)
    user
  end

  private

  attr_reader :headers

  def user
    @user ||= User.find_by_id(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || @errors.merge!(token: 'Invalid token') && nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    return headers['Authorization'].split(' ').last if headers['Authorization'].present?

    @errors.merge!(token: 'Missing token')

    nil
  end
end
