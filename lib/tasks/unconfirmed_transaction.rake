# frozen_string_literal: true

# command: rake unconfirmed_transaction:run

namespace :unconfirmed_transaction do
  desc 'Fetch & save lagest unconfirmed block transaction'
  task run: :environment do
    response = BlockCypherApi.new(Rails.application.credentials.dig(:blockchain_cypher_token)
      
    BlockUnconfirmedTransaction.save_highest_transaction(unconfirmed_transactions)
  rescue Exception => e
    puts ">>>>>>>> Error update - #{e.message} >>>>>>>"
  end
end
