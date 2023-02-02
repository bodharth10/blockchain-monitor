# frozen_string_literal: true

class BlockCypherApi
  include HTTParty
  base_uri 'https://api.blockcypher.com/v1/btc/main'

  def initialize(token)
    @token = token
  end

  def call
    Rails.logger.info('===================================')
    headers = { 'Content-Type' => 'application/json' }
    @response ||= self.class.get(end_point, headers: headers)
    raise Retry if (@response.code == 503) && options[:raise_errors]

    return @response
    if @response.code == 200
      @response
    else
      {}
    end
  rescue StandardError => e
    raise
  rescue Exception => e
    Rails.logger.info('====================================================================')
    Rails.logger.debug("API Calling Error: #{end_point} ==== #{options}")
    {}
  end

  def end_point
    '/txs?token=@token'
  end
end
