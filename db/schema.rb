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

ActiveRecord::Schema.define(version: 2021_04_19_010404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.string "name"
    t.bigint "tag_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_appointments_on_book_id"
    t.index ["tag_id"], name: "index_appointments_on_tag_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.integer "publication_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facts", force: :cascade do |t|
    t.boolean "published"
    t.text "links"
    t.string "headline"
    t.text "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_facts", force: :cascade do |t|
    t.bigint "fact_id"
    t.bigint "food_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fact_id"], name: "index_food_facts_on_fact_id"
    t.index ["food_id"], name: "index_food_facts_on_food_id"
  end

  create_table "foods", force: :cascade do |t|
    t.boolean "published"
    t.text "description"
    t.string "name"
    t.text "image_url"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "high_scores", force: :cascade do |t|
    t.string "game"
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tag_fact_glues", force: :cascade do |t|
    t.bigint "fact_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fact_id"], name: "index_tag_fact_glues_on_fact_id"
    t.index ["tag_id"], name: "index_tag_fact_glues_on_tag_id"
  end

  create_table "tag_foods", force: :cascade do |t|
    t.string "name"
    t.bigint "tag_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_tag_foods_on_book_id"
    t.index ["tag_id"], name: "index_tag_foods_on_tag_id"
  end

  create_table "tag_glues", force: :cascade do |t|
    t.bigint "fact_id"
    t.bigint "food_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fact_id"], name: "index_tag_glues_on_fact_id"
    t.index ["food_id"], name: "index_tag_glues_on_food_id"
    t.index ["tag_id"], name: "index_tag_glues_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "tag_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appointments", "books"
  add_foreign_key "appointments", "tags"
  add_foreign_key "food_facts", "facts"
  add_foreign_key "food_facts", "foods"
  add_foreign_key "tag_fact_glues", "facts"
  add_foreign_key "tag_fact_glues", "tags"
  add_foreign_key "tag_foods", "books"
  add_foreign_key "tag_foods", "tags"
  add_foreign_key "tag_glues", "facts"
  add_foreign_key "tag_glues", "foods"
  add_foreign_key "tag_glues", "tags"
end
