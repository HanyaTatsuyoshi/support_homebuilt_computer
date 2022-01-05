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

ActiveRecord::Schema.define(version: 2022_01_03_061045) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "customs", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.string "case"
    t.text "case_url"
    t.integer "case_price", default: 0
    t.string "cpu"
    t.text "cpu_url"
    t.integer "cpu_price", default: 0
    t.string "gpu"
    t.text "gpu_url"
    t.integer "gpu_price", default: 0
    t.string "motherboard"
    t.text "motherboard_url"
    t.integer "motherboard_price", default: 0
    t.string "memory"
    t.text "memory_url"
    t.integer "memory_price", default: 0
    t.string "cooler"
    t.text "cooler_url"
    t.integer "cooler_price", default: 0
    t.string "m2"
    t.text "m2_url"
    t.integer "m2_price", default: 0
    t.string "ssd"
    t.text "ssd_url"
    t.integer "ssd_price", default: 0
    t.string "hdd"
    t.text "hdd_url"
    t.integer "hdd_price", default: 0
    t.string "psu"
    t.text "psu_url"
    t.integer "psu_price", default: 0
    t.string "peripheral"
    t.text "peripheral_url"
    t.integer "peripheral_price", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "os"
    t.text "os_url"
    t.integer "os_price", default: 0
    t.index ["user_id", "created_at"], name: "index_customs_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_customs_on_user_id"
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
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customs", "users"
end
