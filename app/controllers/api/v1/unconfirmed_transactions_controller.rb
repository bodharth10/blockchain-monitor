# frozen_string_literal: true

module Api
  module V1
    class UnconfirmedTransactionsController < ApplicationController
      def index
        transactions = BlockUnconfirmedTransaction.all
        render json: UnconfirmedTransactionsSerializer.new(transactions).serializable_hash
      end
    end
  end
end
