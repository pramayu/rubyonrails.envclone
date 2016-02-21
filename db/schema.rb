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

ActiveRecord::Schema.define(version: 20160221182407) do

  create_table "browsers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "browserthemes", force: :cascade do |t|
    t.integer  "theme_id",   limit: 4
    t.integer  "browser_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "browserthemes", ["browser_id"], name: "index_browserthemes_on_browser_id", using: :btree
  add_index "browserthemes", ["theme_id"], name: "index_browserthemes_on_theme_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "compatibles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "compatiblethemes", force: :cascade do |t|
    t.integer  "theme_id",      limit: 4
    t.integer  "compatible_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "compatiblethemes", ["compatible_id"], name: "index_compatiblethemes_on_compatible_id", using: :btree
  add_index "compatiblethemes", ["theme_id"], name: "index_compatiblethemes_on_theme_id", using: :btree

  create_table "fileincludes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "fileincludethemes", force: :cascade do |t|
    t.integer  "theme_id",       limit: 4
    t.integer  "fileinclude_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "fileincludethemes", ["fileinclude_id"], name: "index_fileincludethemes_on_fileinclude_id", using: :btree
  add_index "fileincludethemes", ["theme_id"], name: "index_fileincludethemes_on_theme_id", using: :btree

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

  add_foreign_key "browserthemes", "browsers"
  add_foreign_key "browserthemes", "themes"
  add_foreign_key "compatiblethemes", "compatibles"
  add_foreign_key "compatiblethemes", "themes"
  add_foreign_key "fileincludethemes", "fileincludes"
  add_foreign_key "fileincludethemes", "themes"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "themes", "categories"
  add_foreign_key "themes", "subcategories"
end
