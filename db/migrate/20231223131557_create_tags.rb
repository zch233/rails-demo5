class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :icon
      t.string :name, null: false, limit: 20

      t.timestamps
    end
  end
end
