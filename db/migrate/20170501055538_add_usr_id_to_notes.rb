class AddUsrIdToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :usr_id, :integer
  end
end
