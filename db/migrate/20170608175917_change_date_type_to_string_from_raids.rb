class ChangeDateTypeToStringFromRaids < ActiveRecord::Migration[5.0]
  def change
    change_column :raids, :date, :string
  end
end
