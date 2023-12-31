class AddUserToRecords < ActiveRecord::Migration[7.0]
  def change
    add_reference :records, :user
  end
end
