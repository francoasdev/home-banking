class AddReferencesToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :transactions, :cards, column: :sender_card_id, null: false
    add_foreign_key :transactions, :cards, column: :recipient_card_id, null: false
  end
end
