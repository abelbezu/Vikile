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

ActiveRecord::Schema.define(version: 20150710013404) do

  create_table "accounts", force: :cascade do |t|
    t.string   "first_name",             limit: 50
    t.string   "last_name",              limit: 50
    t.string   "email",                                                             null: false
    t.string   "gender"
    t.string   "privilege",                         default: "user"
    t.string   "oauth_token"
    t.string   "provider"
    t.string   "refresh_token"
    t.datetime "oauth_expires_at"
    t.string   "display_name",           limit: 50
    t.string   "picture",                limit: 50, default: "profile_default.png"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",                default: "",                    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,                     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true

  create_table "advertisements", force: :cascade do |t|
    t.integer  "content_id"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "article_edits", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "account_id"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "article_edits", ["article_id", "account_id"], name: "index_article_edits_on_article_id_and_account_id"

  create_table "articles", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "title"
    t.string   "category"
    t.text     "introduction"
    t.text     "tags"
    t.string   "segment_type"
    t.string   "visible",      default: "f"
    t.string   "status",       default: "draft"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "main_image",   default: "article_default.jpg"
  end

  add_index "articles", ["account_id"], name: "index_articles_on_account_id"
  add_index "articles", ["parent_id"], name: "index_articles_on_parent_id"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "contents", force: :cascade do |t|
    t.integer  "content_owner_id"
    t.string   "content_owner_type"
    t.string   "content_type"
    t.text     "content_body"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "contents", ["content_owner_id"], name: "index_contents_on_content_owner_id"

  create_table "edit_logs", force: :cascade do |t|
    t.integer  "articles_id"
    t.string   "edited_part"
    t.text     "previous_value"
    t.text     "new_value"
    t.string   "edit_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: :cascade do |t|
    t.integer  "image_owner_id"
    t.string   "image_owner_type"
    t.string   "url"
    t.string   "picture"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["image_owner_id"], name: "index_images_on_image_owner_id"

  create_table "parts", force: :cascade do |t|
    t.integer  "article_id"
    t.string   "part_type",  limit: 255
    t.string   "part_title", limit: 255
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parts", ["article_id"], name: "index_parts_on_article_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "segments", force: :cascade do |t|
    t.integer  "article_id"
    t.string   "type"
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "segments", ["article_id"], name: "index_segments_on_article_id"

  create_table "stats", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "shares"
    t.integer  "views"
    t.integer  "helpful"
    t.integer  "edits"
    t.integer  "likes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stats", ["article_id"], name: "index_stats_on_article_id"

  create_table "tips", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "tip_position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "child_id"
    t.integer  "editor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "versions", ["child_id"], name: "index_versions_on_child_id"
  add_index "versions", ["parent_id", "child_id"], name: "index_versions_on_parent_id_and_child_id", unique: true
  add_index "versions", ["parent_id"], name: "index_versions_on_parent_id"

  create_table "warnings", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "warning_position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
