class ChangeDateTypeFromRaids < ActiveRecord::Migration[5.0]
  def change
    change_column :raids, :date, :date
  end
end
