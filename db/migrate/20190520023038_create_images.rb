class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :url
      t.references :tour_detail, foreign_key: true

      t.timestamps
    end
     add_index :images, [:tour_detail_id, :created_at]
  end
end
