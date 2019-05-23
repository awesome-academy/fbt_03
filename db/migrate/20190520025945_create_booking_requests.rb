class CreateBookingRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_requests do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :quantity
      t.boolean :payment, default: false
      t.references :user, foreign_key: true
      t.references :tour, foreign_key: true

      t.timestamps
    end
  end
end
