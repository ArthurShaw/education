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

ActiveRecord::Schema.define(version: 20151214083342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "workshop_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "events", force: :cascade do |t|
    t.string  "title",                       null: false
    t.string  "description"
    t.date    "date"
    t.time    "from"
    t.time    "to"
    t.string  "title_en",       default: "", null: false
    t.string  "description_en", default: "", null: false
    t.integer "workshop_id"
  end

  create_table "events_sections", id: false, force: :cascade do |t|
    t.integer "event_id"
    t.integer "section_id"
  end

  create_table "listener_requests", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "country"
    t.string   "city"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "arrival"
    t.date     "departure"
    t.boolean  "hotel"
  end

  create_table "mail_contents", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.text     "content",    default: "", null: false
    t.text     "content_en", default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "page_contents", force: :cascade do |t|
    t.string   "name",         default: "",    null: false
    t.text     "content",      default: "",    null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "content_en",   default: "",    null: false
    t.string   "name_en",      default: "",    null: false
    t.boolean  "hidden",       default: false, null: false
    t.integer  "content_type", default: 0,     null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "schedule_events", force: :cascade do |t|
    t.integer "schedule_sub_interval_id"
    t.integer "workshop_id"
    t.string  "title",                    null: false
    t.string  "title_en",                 null: false
  end

  create_table "schedule_intervals", force: :cascade do |t|
    t.string  "title",          null: false
    t.string  "title_en",       null: false
    t.string  "description"
    t.string  "description_en"
    t.date    "date"
    t.time    "from"
    t.time    "to"
    t.integer "workshop_id"
    t.integer "section_id"
  end

  create_table "schedule_sub_intervals", force: :cascade do |t|
    t.time    "from"
    t.time    "to"
    t.integer "schedule_interval_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string  "title",                          null: false
    t.string  "title_en"
    t.boolean "is_main",        default: false, null: false
    t.text    "description",    default: "",    null: false
    t.text    "description_en", default: "",    null: false
  end

  create_table "special_guests", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.text     "about"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "first_name_en"
    t.string   "last_name_en"
    t.string   "middle_name_en"
    t.text     "about_en"
    t.integer  "guest_type",          default: 0,  null: false
    t.text     "about_long",          default: "", null: false
    t.text     "about_long_en",       default: "", null: false
  end

  create_table "sponsor_categories", force: :cascade do |t|
    t.string "name",                 null: false
    t.string "name_en", default: "", null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "name"
    t.integer  "sponsor_category_id"
    t.string   "url",                 default: "", null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "country"
    t.string   "city"
    t.string   "degree"
    t.string   "phone"
    t.text     "biography"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.date     "arrival"
    t.date     "departure"
    t.boolean  "hotel"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "workshops", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "section_id"
    t.integer  "status",           default: 0,  null: false
    t.integer  "special_guest_id"
    t.string   "title_en",         default: "", null: false
    t.text     "description_en",   default: "", null: false
  end

  add_foreign_key "articles", "users", on_delete: :cascade
  add_foreign_key "comments", "users"
  add_foreign_key "comments", "workshops"
  add_foreign_key "events", "workshops"
  add_foreign_key "sponsors", "sponsor_categories"
  add_foreign_key "workshops", "sections"
  add_foreign_key "workshops", "special_guests"
  add_foreign_key "workshops", "users"
end
