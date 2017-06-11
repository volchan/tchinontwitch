class AddFactionToRaids < ActiveRecord::Migration[5.0]
  def change
    add_column :raids, :faction, :integer
  end
end
