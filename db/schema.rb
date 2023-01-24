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

ActiveRecord::Schema.define(version: 2023_01_24_080931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concepts", force: :cascade do |t|
    t.text "text"
    t.text "meaning"
    t.text "image"
    t.text "example"
    t.text "source"
    t.text "translation"
    t.text "note"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concepts_roots", id: false, force: :cascade do |t|
    t.integer "concept_id"
    t.integer "root_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "linkages", force: :cascade do |t|
    t.bigint "concept_id"
    t.bigint "linking_concept_id"
    t.integer "association_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concept_id"], name: "index_linkages_on_concept_id"
    t.index ["linking_concept_id"], name: "index_linkages_on_linking_concept_id"
  end

  create_table "relations", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roots", force: :cascade do |t|
    t.text "text"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "email"
    t.boolean "is_admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "linkages", "concepts"
  add_foreign_key "linkages", "concepts", column: "linking_concept_id"
end
