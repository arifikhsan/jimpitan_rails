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

ActiveRecord::Schema.define(version: 2021_09_29_073050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.bigint "village_id", null: false
    t.bigint "user_id", null: false
    t.date "date"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_attendances_on_user_id"
    t.index ["village_id"], name: "index_attendances_on_village_id"
  end

  create_table "donations", force: :cascade do |t|
    t.bigint "village_id", null: false
    t.bigint "family_id", null: false
    t.bigint "patrol_member_id", null: false
    t.bigint "village_donation_id", null: false
    t.date "date"
    t.datetime "taken_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["family_id"], name: "index_donations_on_family_id"
    t.index ["patrol_member_id"], name: "index_donations_on_patrol_member_id"
    t.index ["village_donation_id"], name: "index_donations_on_village_donation_id"
    t.index ["village_id"], name: "index_donations_on_village_id"
  end

  create_table "families", force: :cascade do |t|
    t.bigint "village_id", null: false
    t.string "householder"
    t.integer "rt"
    t.integer "rw"
    t.integer "number"
    t.text "detail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["village_id"], name: "index_families_on_village_id"
  end

  create_table "patrol_members", force: :cascade do |t|
    t.bigint "village_id", null: false
    t.bigint "user_id", null: false
    t.integer "day_in_week"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_patrol_members_on_user_id"
    t.index ["village_id"], name: "index_patrol_members_on_village_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_details", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "phone_number"
    t.integer "rt"
    t.integer "rw"
    t.text "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_details_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "role_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "village_donations", force: :cascade do |t|
    t.bigint "village_id", null: false
    t.string "title"
    t.integer "type"
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["village_id"], name: "index_village_donations_on_village_id"
  end

  create_table "village_managers", force: :cascade do |t|
    t.bigint "village_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_village_managers_on_user_id"
    t.index ["village_id"], name: "index_village_managers_on_village_id"
  end

  create_table "villages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "attendances", "users"
  add_foreign_key "attendances", "villages"
  add_foreign_key "donations", "families"
  add_foreign_key "donations", "patrol_members"
  add_foreign_key "donations", "village_donations"
  add_foreign_key "donations", "villages"
  add_foreign_key "families", "villages"
  add_foreign_key "patrol_members", "users"
  add_foreign_key "patrol_members", "villages"
  add_foreign_key "user_details", "users"
  add_foreign_key "users", "roles"
  add_foreign_key "village_donations", "villages"
  add_foreign_key "village_managers", "users"
  add_foreign_key "village_managers", "villages"
end
