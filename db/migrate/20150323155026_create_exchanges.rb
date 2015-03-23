class CreateExchanges < ActiveRecord::Migration
  def change
    create_table "exchanges", force: true do |t|
      t.float    "amount",         null: false
      t.float    "exchange_rate",  null: false
      t.string   "from_currency",  null: false
      t.string   "to_currency",    null: false
      t.datetime "transferred_at", null: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "ledger_id",      null: false
    end

    add_index :exchanges, :ledger_id
  end
end
