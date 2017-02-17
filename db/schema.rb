# frozen_string_literal: true
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

ActiveRecord::Schema.define(version: 20170217093153) do
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
    t.boolean "send_follow_up_mail", default: true
    t.datetime "started_at"
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.integer "age"
    t.text "comment"
    t.integer "contact_preference"
    t.string "country"
    t.datetime "created_at", null: false
    t.string "email"
    t.boolean "engaged", default: false
    t.integer "gender"
    t.string "id_number"
    t.string "name"
    t.string "phone_number"
    t.integer "status"
    t.datetime "updated_at", null: false
  end

  create_table "profession_taggings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "person_id"
    t.integer "profession_id"
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_profession_taggings_on_person_id", using: :btree
    t.index ["profession_id"], name: "index_profession_taggings_on_profession_id", using: :btree
  end

  create_table "professions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "status_updates", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "match_id"
    t.integer "status"
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_status_updates_on_match_id", using: :btree
  end

  add_foreign_key "interest_taggings", "interests"
  add_foreign_key "interest_taggings", "people"
  add_foreign_key "profession_taggings", "people"
  add_foreign_key "profession_taggings", "professions"
  add_foreign_key "status_updates", "matches"
end
