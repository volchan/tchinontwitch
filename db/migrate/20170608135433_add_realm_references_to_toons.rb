class AddRealmReferencesToToons < ActiveRecord::Migration[5.0]
  def change
    add_reference :toons, :realm, foreign_key: true
  end
end
