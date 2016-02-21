# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160221161647) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "category_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id", using: :btree

  create_table "themes", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.text     "description",    limit: 65535
    t.decimal  "price",                        precision: 10
    t.string   "resolution",     limit: 255
    t.string   "layout",         limit: 255
    t.string   "demo",           limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "category_id",    limit: 4
    t.integer  "subcategory_id", limit: 4
  end

  add_index "themes", ["category_id"], name: "index_themes_on_category_id", using: :btree
  add_index "themes", ["subcategory_id"], name: "index_themes_on_subcategory_id", using: :btree

  add_foreign_key "subcategories", "categories"
  add_foreign_key "themes", "categories"
  add_foreign_key "themes", "subcategories"
end
