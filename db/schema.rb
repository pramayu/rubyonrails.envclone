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

ActiveRecord::Schema.define(version: 20160224033111) do

  create_table "assets", force: :cascade do |t|
    t.integer  "theme_id",             limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "preview_file_name",    limit: 255
    t.string   "preview_content_type", limit: 255
    t.integer  "preview_file_size",    limit: 4
    t.datetime "preview_updated_at"
  end

  add_index "assets", ["theme_id"], name: "index_assets_on_theme_id", using: :btree

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

  create_table "devices", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "devicethemes", force: :cascade do |t|
    t.integer  "theme_id",   limit: 4
    t.integer  "device_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "devicethemes", ["device_id"], name: "index_devicethemes_on_device_id", using: :btree
  add_index "devicethemes", ["theme_id"], name: "index_devicethemes_on_theme_id", using: :btree

  create_table "emails", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "emailthemes", force: :cascade do |t|
    t.integer  "theme_id",   limit: 4
    t.integer  "email_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "emailthemes", ["email_id"], name: "index_emailthemes_on_email_id", using: :btree
  add_index "emailthemes", ["theme_id"], name: "index_emailthemes_on_theme_id", using: :btree

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

  create_table "frameworks", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "frameworkthemes", force: :cascade do |t|
    t.integer  "theme_id",     limit: 4
    t.integer  "framework_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "frameworkthemes", ["framework_id"], name: "index_frameworkthemes_on_framework_id", using: :btree
  add_index "frameworkthemes", ["theme_id"], name: "index_frameworkthemes_on_theme_id", using: :btree

  create_table "softwares", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "softwarethemes", force: :cascade do |t|
    t.integer  "theme_id",    limit: 4
    t.integer  "software_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "softwarethemes", ["software_id"], name: "index_softwarethemes_on_software_id", using: :btree
  add_index "softwarethemes", ["theme_id"], name: "index_softwarethemes_on_theme_id", using: :btree

  create_table "subcategories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "category_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id", using: :btree

  create_table "themes", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "description",        limit: 65535
    t.decimal  "price",                            precision: 10
    t.string   "resolution",         limit: 255
    t.string   "layout",             limit: 255
    t.string   "demo",               limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "category_id",        limit: 4
    t.integer  "subcategory_id",     limit: 4
    t.string   "widget",             limit: 255
    t.string   "layered",            limit: 255
    t.string   "adobe",              limit: 255
    t.string   "pixel",              limit: 255
    t.string   "print",              limit: 255
    t.string   "column",             limit: 255
    t.string   "thumb_file_name",    limit: 255
    t.string   "thumb_content_type", limit: 255
    t.integer  "thumb_file_size",    limit: 4
    t.datetime "thumb_updated_at"
    t.string   "clip_file_name",     limit: 255
    t.string   "clip_content_type",  limit: 255
    t.integer  "clip_file_size",     limit: 4
    t.datetime "clip_updated_at"
  end

  add_index "themes", ["category_id"], name: "index_themes_on_category_id", using: :btree
  add_index "themes", ["subcategory_id"], name: "index_themes_on_subcategory_id", using: :btree

  add_foreign_key "assets", "themes"
  add_foreign_key "browserthemes", "browsers"
  add_foreign_key "browserthemes", "themes"
  add_foreign_key "compatiblethemes", "compatibles"
  add_foreign_key "compatiblethemes", "themes"
  add_foreign_key "devicethemes", "devices"
  add_foreign_key "devicethemes", "themes"
  add_foreign_key "emailthemes", "emails"
  add_foreign_key "emailthemes", "themes"
  add_foreign_key "fileincludethemes", "fileincludes"
  add_foreign_key "fileincludethemes", "themes"
  add_foreign_key "frameworkthemes", "frameworks"
  add_foreign_key "frameworkthemes", "themes"
  add_foreign_key "softwarethemes", "softwares"
  add_foreign_key "softwarethemes", "themes"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "themes", "categories"
  add_foreign_key "themes", "subcategories"
end
