class CreateRemittances < ActiveRecord::Migration
  def change
    create_table :remittances do |t|
      t.string :currency, null: false
      t.float :amount, null: false
      t.timestamp :transferred_at, null: false
      t.integer :ledger_id, null: false
      t.timestamps
    end

    add_index :remittances, :ledger_id
  end
end
