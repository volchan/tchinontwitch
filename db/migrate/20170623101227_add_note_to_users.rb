class AddNoteToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :note, :text
  end
end
