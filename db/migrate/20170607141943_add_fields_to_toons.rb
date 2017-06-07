class AddFieldsToToons < ActiveRecord::Migration[5.0]
  def change
    add_column :toons, :spec_name, :string
    add_column :toons, :spec_role, :string
    add_column :toons, :spec_icon, :string
    add_column :toons, :guild_name, :string
    add_column :toons, :guild_realm, :string
  end
end
