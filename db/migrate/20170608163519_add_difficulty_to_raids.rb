class AddDifficultyToRaids < ActiveRecord::Migration[5.0]
  def change
    add_column :raids, :difficulty, :integer
  end
end
