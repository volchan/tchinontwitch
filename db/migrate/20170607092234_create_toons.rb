class CreateToons < ActiveRecord::Migration[5.0]
  def change
    create_table :toons do |t|
      t.string :name
      t.string :realm
      t.integer :class_id
      t.integer :race_id
      t.integer :level
      t.integer :i_level
      t.string :thumbnail
      t.integer :faction
      t.integer :tag_status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
