class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.integer :category, null: false, limit: 1
      t.integer :amount, null: false
      t.datetime :sign_time, null: false
      t.string :notes

      t.timestamps
    end

  end
end
