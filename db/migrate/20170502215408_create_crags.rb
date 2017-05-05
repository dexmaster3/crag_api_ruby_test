class CreateCrags < ActiveRecord::Migration[5.1]
  def change
    create_table :crags do |t|
      t.string :title
      t.string :image
      t.float :rating
      t.string :created_by

      t.timestamps
    end
  end
end
