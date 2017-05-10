class CreateNodes < ActiveRecord::Migration[5.1]
  def change
    create_table :nodes do |t|
      t.float :xcoord
      t.float :ycoord
      t.integer :weight
      t.references :crag, foreign_key: true

      t.timestamps
    end
  end
end
