class CreateLedgers < ActiveRecord::Migration
  def change
    create_table :ledgers do |t|
      t.string :access_token, unique: true
      t.timestamps
    end
  end
end
