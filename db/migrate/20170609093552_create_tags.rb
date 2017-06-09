class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.references :toon, foreign_key: true
      t.references :raid, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
