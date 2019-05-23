class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.datetime :start_date
      t.decimal :price
      t.integer :quantity, default: 100
      t.references :tour_detail, foreign_key: true

      t.timestamps
    end
  end
end
