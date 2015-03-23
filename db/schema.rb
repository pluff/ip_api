# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150323155433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  add_index "exchanges", ["ledger_id"], name: "index_exchanges_on_ledger_id", using: :btree

  create_table "ledgers", force: true do |t|
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "remittances", force: true do |t|
    t.string   "currency",       null: false
    t.float    "amount",         null: false
    t.datetime "transferred_at", null: false
    t.integer  "ledger_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "remittances", ["ledger_id"], name: "index_remittances_on_ledger_id", using: :btree

end
