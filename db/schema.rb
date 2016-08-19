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

ActiveRecord::Schema.define(version: 20160819212528) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_admin_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.text "password_digest"
    t.datetime "updated_at", null: false
  end

  create_table "interest_taggings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "interest_id"
    t.integer "person_id"
    t.datetime "updated_at", null: false
    t.index ["interest_id"], name: "index_interest_taggings_on_interest_id", using: :btree
    t.index ["person_id"], name: "index_interest_taggings_on_person_id", using: :btree
  end

  create_table "interests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.text "comment"
    t.datetime "concluded_at"
    t.datetime "created_at", null: false
    t.integer "established_id"
    t.datetime "follow_up_mail_sent_at"
    t.integer "newcomer_id"
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.integer "age"
    t.text "comment"
    t.string "country"
    t.datetime "created_at", null: false
    t.string "email"
    t.boolean "engaged", default: false
    t.integer "gender"
    t.string "name"
    t.string "phone_number"
    t.integer "status"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "interest_taggings", "interests"
  add_foreign_key "interest_taggings", "people"
end
