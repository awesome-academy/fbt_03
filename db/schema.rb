# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_20_065129) do

  create_table "booking_requests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.integer "quantity"
    t.boolean "payment"
    t.bigint "user_id"
    t.bigint "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_booking_requests_on_tour_id"
    t.index ["user_id"], name: "index_booking_requests_on_user_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.bigint "review_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_comments_on_review_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "url"
    t.bigint "tour_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_detail_id", "created_at"], name: "index_images_on_tour_detail_id_and_created_at"
    t.index ["tour_detail_id"], name: "index_images_on_tour_detail_id"
  end

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.integer "ratting", default: 0
    t.bigint "user_id"
    t.bigint "tour_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_detail_id"], name: "index_reviews_on_tour_detail_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tour_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "name"
    t.text "duration"
    t.text "information"
    t.float "average_ratting", default: 0.0
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id", "created_at"], name: "index_tour_details_on_category_id_and_created_at"
    t.index ["category_id"], name: "index_tour_details_on_category_id"
  end

  create_table "tours", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "start_date"
    t.decimal "price", precision: 10
    t.bigint "tour_detail_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_tours_on_category_id"
    t.index ["tour_detail_id", "category_id", "created_at"], name: "index_tours_on_tour_detail_id_and_category_id_and_created_at"
    t.index ["tour_detail_id"], name: "index_tours_on_tour_detail_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "reset_digest"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "booking_requests", "tours"
  add_foreign_key "booking_requests", "users"
  add_foreign_key "comments", "reviews"
  add_foreign_key "comments", "users"
  add_foreign_key "images", "tour_details"
  add_foreign_key "reviews", "tour_details"
  add_foreign_key "reviews", "users"
  add_foreign_key "tour_details", "categories"
  add_foreign_key "tours", "categories"
  add_foreign_key "tours", "tour_details"
end
