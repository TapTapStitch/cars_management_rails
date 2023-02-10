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

ActiveRecord::Schema[7.0].define(version: 2023_02_10_130446) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "make", null: false
    t.string "model", null: false
    t.integer "year", null: false
    t.integer "odometer", null: false
    t.integer "price", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "make"
    t.string "model"
    t.integer "year_from"
    t.integer "year_to"
    t.integer "odometer_from"
    t.integer "odometer_to"
    t.integer "price_from"
    t.integer "price_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
