# frozen_string_literal: true

class CreateBlockUnconfirmedTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :block_unconfirmed_transactions do |t|
      t.json :data
      t.string :block_hash

      t.timestamps
    end
    add_index :block_unconfirmed_transactions, :block_hash
  end
end
