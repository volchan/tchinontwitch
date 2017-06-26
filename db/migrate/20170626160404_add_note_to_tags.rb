class AddNoteToTags < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :note, :text
  end
end
