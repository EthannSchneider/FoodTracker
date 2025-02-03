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

ActiveRecord::Schema[8.0].define(version: 2025_01_30_092713) do
  create_table "body_measurements", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "date", null: false
    t.decimal "weight", null: false
    t.decimal "body_fat_percentage"
    t.decimal "waist_size"
    t.decimal "chest_size"
    t.decimal "hip_size"
    t.decimal "left_arm_size"
    t.decimal "right_arm_size"
    t.decimal "left_forearm_size"
    t.decimal "right_forearm_size"
    t.decimal "right_thighs_size"
    t.decimal "left_thighs_size"
    t.decimal "right_calves_size"
    t.decimal "left_calves_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "date"], name: "index_body_measurements_on_user_id_and_date", unique: true
    t.index ["user_id"], name: "index_body_measurements_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name", null: false
    t.date "date", null: false
    t.integer "meal_type", default: 0, null: false
    t.integer "calories", default: 0, null: false
    t.integer "carbs", default: 0, null: false
    t.integer "protein", default: 0, null: false
    t.integer "fat", default: 0, null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname", default: "", null: false
    t.string "lastname", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "body_measurements", "users"
  add_foreign_key "meals", "users"
end
