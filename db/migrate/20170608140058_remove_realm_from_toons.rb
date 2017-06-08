class RemoveRealmFromToons < ActiveRecord::Migration[5.0]
  def change
    remove_column :toons, :realm, :string
  end
end
