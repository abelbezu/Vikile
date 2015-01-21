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

ActiveRecord::Schema.define(version: 20150121061213) do

  create_table "accounts", force: true do |t|
    t.string   "first_name",      limit: 50
    t.string   "last_name",       limit: 50
    t.string   "email",                                                      null: false
    t.string   "gender"
    t.string   "privilage",                  default: "user"
    t.string   "token"
    t.string   "refresh_token"
    t.string   "expires_at"
    t.string   "display_name",    limit: 50
    t.string   "password_digest",                                            null: false
    t.string   "picture",         limit: 50, default: "profile_default.png"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "follower_id"
  end

  create_table "article_edits", force: true do |t|
    t.integer  "article_id"
    t.integer  "account_id"
    t.string   "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "article_edits", ["article_id", "account_id"], name: "index_article_edits_on_article_id_and_account_id", using: :btree

  create_table "articles", force: true do |t|
    t.integer  "account_id"
    t.string   "title"
    t.string   "category"
    t.text     "introduction"
    t.string   "tags"
    t.string   "visible",      default: "1"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",       default: "draft"
  end

  add_index "articles", ["account_id"], name: "index_articles_on_account_id", using: :btree

  create_table "contents", force: true do |t|
    t.integer  "content_owner_id"
    t.string   "content_owner_type"
    t.string   "content_type"
    t.text     "content_body"
    t.text     "content_bullet_list"
    t.text     "picture"
    t.string   "video"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contents", ["content_owner_id"], name: "index_contents_on_content_owner_id", using: :btree

  create_table "images", force: true do |t|
    t.integer  "image_owner_id"
    t.string   "image_owner_type"
    t.string   "image_body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts", force: true do |t|
    t.integer  "article_id"
    t.string   "part_type"
    t.string   "part_title"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parts", ["article_id"], name: "index_parts_on_article_id", using: :btree

  create_table "segments", force: true do |t|
    t.integer  "article_id"
    t.string   "type"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "segments", ["article_id"], name: "index_segments_on_article_id", using: :btree

  create_table "stats", force: true do |t|
    t.integer  "article_id"
    t.integer  "shares"
    t.integer  "views"
    t.integer  "helpful"
    t.integer  "edits"
    t.integer  "likes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stats", ["article_id"], name: "index_stats_on_article_id", using: :btree

end
