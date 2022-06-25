# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_20_041008) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "makers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "maker_id"
    t.string "no"
    t.string "name"
    t.string "image_path"
    t.string "category"
    t.integer "price"
    t.text "description"
    t.date "release_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "product_id"
    t.string "review_user_name"
    t.text "content"
    t.string "tag"
    t.float "total_evaluation"
    t.integer "price_evaluation"
    t.integer "design_evaluation"
    t.integer "quality_evaluation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
