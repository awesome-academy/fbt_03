class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :ratting, default: 0
      t.references :user, foreign_key: true
      t.references :tour_detail, foreign_key: true

      t.timestamps
    end
  end
end
