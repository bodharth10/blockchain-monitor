# frozen_string_literal: true

require 'rails_helper'

require "support/api_helpers"

RSpec.describe 'BlockUnconfirmedTransactions', type: :request do
  describe 'GET /index' do
    before { allow(controller).to receive(:authenticate_request).and_return(true) }

    before do
      get '/api/v1/unconfirmed_transactions'
    end

    # it 'returns all unconfirmed transactions' do
    #   expect(JSON.parse(response.body)).to eq(1)
    # end

    # it 'returns status code 200' do
    #   expect(response).to have_http_status(:success)
    # end

    it 'returns status code 401' do
      expect(response).to have_http_status('401')
    end
  end
end
