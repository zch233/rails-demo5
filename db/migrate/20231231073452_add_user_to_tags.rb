class AddUserToTags < ActiveRecord::Migration[7.0]
  def change
    add_reference :tags, :user
  end
end
