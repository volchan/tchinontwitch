class AddLeaderIdToRaids < ActiveRecord::Migration[5.0]
  def change
    add_column :raids, :leader_id, :integer
  end
end
