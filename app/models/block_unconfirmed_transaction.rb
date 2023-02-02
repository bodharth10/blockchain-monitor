# frozen_string_literal: true

class BlockUnconfirmedTransaction < ApplicationRecord
  validates_presence_of :data
  validates :block_hash, uniqueness: true

  def self.save_highest_transaction(transactions)
    selected_unconfirmed_transactions = transactions.select { |transaction| (transaction[:confirmations]).zero? }
    largest_unconfirmed_transaction = selected_unconfirmed_transactions.max_by { |transaction| transaction[:size] }
    t = find_or_initialize_by(block_hash: largest_unconfirmed_transaction[:hash])
    t.data = largest_unconfirmed_transaction.slice(:hash, :total, :fees, :inputs, :outputs)
    t.save!
  rescue StandardError
  end
end
