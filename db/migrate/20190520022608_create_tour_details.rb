class CreateTourDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :tour_details do |t|
      t.text :name
      t.text :duration
      t.text :information
      t.float :average_ratting, default: 0
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :tour_details, [:category_id, :created_at]
  end
end
