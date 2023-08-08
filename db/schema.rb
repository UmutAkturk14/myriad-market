# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_08_090659) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "itemable_type", null: false
    t.bigint "itemable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itemable_type", "itemable_id"], name: "index_items_on_itemable"
  end

  create_table "offers", force: :cascade do |t|
    t.string "offerable_type", null: false
    t.bigint "offerable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offerable_type", "offerable_id"], name: "index_offers_on_offerable"
  end

  create_table "properties", force: :cascade do |t|
    t.string "property_type"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.integer "square_feet"
    t.integer "age"
    t.integer "floor"
    t.bigint "price"
    t.string "address"
    t.string "city"
    t.string "state"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "service_type"
    t.string "title"
    t.bigint "hourly_rate"
    t.string "location"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.string "username"
    t.string "phone_number"
    t.string "address"
    t.string "country"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "vehicle_type"
    t.string "make"
    t.string "model"
    t.integer "year"
    t.integer "mileage"
    t.bigint "price"
    t.string "fuel_type"
    t.string "transmission"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
