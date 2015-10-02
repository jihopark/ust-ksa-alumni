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

ActiveRecord::Schema.define(version: 20151002033106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.integer  "job_post_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "attendances", ["job_post_id"], name: "index_attendances_on_job_post_id", using: :btree
  add_index "attendances", ["user_id"], name: "index_attendances_on_user_id", using: :btree

  create_table "declarations", force: :cascade do |t|
    t.integer  "major_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.integer  "industry_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "industries", force: :cascade do |t|
    t.string   "name"
    t.boolean  "favorite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "industry_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "email"
    t.string   "secret_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_posts", force: :cascade do |t|
    t.string   "description"
    t.string   "title"
    t.date     "event_time"
    t.string   "event_venue"
    t.date     "expire_date"
    t.boolean  "published"
    t.string   "code"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "admin_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "job_post_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "likes", ["job_post_id"], name: "index_likes_on_job_post_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "majors", force: :cascade do |t|
    t.string   "name"
    t.string   "school"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.integer  "job_post_id"
    t.integer  "major_id"
    t.integer  "industry_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "preferences", ["industry_id"], name: "index_preferences_on_industry_id", using: :btree
  add_index "preferences", ["job_post_id"], name: "index_preferences_on_job_post_id", using: :btree
  add_index "preferences", ["major_id"], name: "index_preferences_on_major_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "entrance_year"
    t.datetime "graduation_year"
    t.string   "status"
    t.string   "name"
    t.string   "location"
    t.string   "organization"
    t.string   "position"
    t.string   "profile_pic_url"
    t.string   "linkedin_url"
    t.string   "auth_token"
    t.string   "provider"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
