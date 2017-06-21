class ChangeDateFormatFromRaids < ActiveRecord::Migration[5.0]
  def change
    remove_column :raids, :date
    add_column :raids, :date, :datetime
  end
end
