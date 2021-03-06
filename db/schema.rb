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

ActiveRecord::Schema.define(version: 20161205112341) do

  create_table "comments", force: :cascade do |t|
    t.string   "username"
    t.text     "body"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "helps", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "tagged_post_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "helps", ["post_id"], name: "index_helps_on_post_id"
  add_index "helps", ["tagged_post_id"], name: "index_helps_on_tagged_post_id"
  add_index "helps", ["user_id"], name: "index_helps_on_user_id"

  create_table "inspires", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "tagged_post_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "inspires", ["post_id"], name: "index_inspires_on_post_id"
  add_index "inspires", ["tagged_post_id"], name: "index_inspires_on_tagged_post_id"
  add_index "inspires", ["user_id"], name: "index_inspires_on_user_id"

  create_table "likes", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "tagged_post_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "likes", ["post_id"], name: "index_likes_on_post_id"
  add_index "likes", ["tagged_post_id"], name: "index_likes_on_tagged_post_id"
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "notifications", force: :cascade do |t|
    t.string   "action"
    t.string   "post"
    t.integer  "action_id"
    t.integer  "user_id"
    t.integer  "post_id"
    t.integer  "tagged_post_id"
    t.text     "message",        default: ""
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "points", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "amount",     default: 0
    t.string   "variety"
    t.integer  "level",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "points", ["user_id"], name: "index_points_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
    t.string   "username"
    t.integer  "likes"
    t.boolean  "public",     default: true
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "info",        default: ""
    t.text     "motivations", default: ""
    t.text     "priorities",  default: ""
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "tagged_posts", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "category"
    t.string   "tag"
    t.string   "username"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "likes"
    t.boolean  "public",     default: true
  end

  add_index "tagged_posts", ["user_id"], name: "index_tagged_posts_on_user_id"

  create_table "taggedcomments", force: :cascade do |t|
    t.string   "username"
    t.text     "body"
    t.integer  "tagged_post_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "taggedcomments", ["tagged_post_id"], name: "index_taggedcomments_on_tagged_post_id"
  add_index "taggedcomments", ["user_id"], name: "index_taggedcomments_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "admin",                  default: false
    t.string   "username"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "spanish",                default: false
    t.string   "location",               default: "Unknown"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username"

end
