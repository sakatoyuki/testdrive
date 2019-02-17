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

ActiveRecord::Schema.define(version: 2019_02_17_015917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "name", null: false
    t.integer "count", null: false
    t.string "car_image", null: false
    t.integer "dealer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dealers", force: :cascade do |t|
    t.string "name", null: false
    t.string "login_id", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.index ["login_id"], name: "index_dealers_on_login_id", unique: true
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "date", null: false
    t.integer "time", null: false
    t.integer "user_id", null: false
    t.integer "car_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string "name", null: false
    t.string "waiting_spot", null: false
    t.string "map_image", null: false
    t.integer "dealer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "date", null: false
    t.integer "time", null: false
    t.integer "availables", null: false
    t.integer "car_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.integer "tel", null: false
    t.integer "postalcode", null: false
    t.string "address", null: false
    t.integer "current_maker", null: false
    t.string "current_car", null: false
    t.string "status", null: false
    t.string "candidate", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
