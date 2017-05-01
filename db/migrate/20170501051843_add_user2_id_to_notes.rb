class AddUser2IdToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :user2_id, :integer
  end
end
