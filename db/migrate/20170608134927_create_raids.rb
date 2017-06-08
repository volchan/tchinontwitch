class CreateRaids < ActiveRecord::Migration[5.0]
  def change
    create_table :raids do |t|
      t.references :dungeon, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
