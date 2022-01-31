class AddColumnsToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :sender_card_id, :integer, null: false
    add_column :transactions, :recipient_card_id, :integer, null: false
  end
end
