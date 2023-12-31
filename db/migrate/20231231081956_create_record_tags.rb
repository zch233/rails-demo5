class CreateRecordTags < ActiveRecord::Migration[7.0]
  def change
    create_table :record_tags do |t|
      t.references :record, null: false
      t.references :tag, null: false
      t.timestamps
    end
  end
end
