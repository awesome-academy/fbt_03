class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.datetime :start_date
      t.decimal :price
      t.references :tour_detail, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
    add_index :tours, [:tour_detail_id, :category_id, :created_at]
  end
end
