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

ActiveRecord::Schema.define(version: 20150615032016) do

  create_table "answer_logs", force: :cascade do |t|
    t.integer  "user_id",       limit: 4,   null: false
    t.integer  "article_id",    limit: 4,   null: false
    t.string   "column_dummy1", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "answer_logs", ["article_id"], name: "index_answer_logs_on_article_id", using: :btree
  add_index "answer_logs", ["user_id"], name: "index_answer_logs_on_user_id", using: :btree

  create_table "article_groups", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "article_groups", ["user_id"], name: "index_article_groups_on_user_id", using: :btree

  create_table "articlemarks", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "article_id",       limit: 4
    t.integer  "answered_counter", limit: 4
    t.boolean  "important_flag",   limit: 1
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "articlemarks", ["article_id"], name: "index_articlemarks_on_article_id", using: :btree
  add_index "articlemarks", ["user_id"], name: "index_articlemarks_on_user_id", using: :btree

  create_table "articles", force: :cascade do |t|
    t.text     "question_body",    limit: 65535, null: false
    t.integer  "answered_counter", limit: 4,     null: false
    t.boolean  "important_flag",   limit: 1,     null: false
    t.integer  "article_group_id", limit: 4,     null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "articles", ["article_group_id"], name: "index_articles_on_article_group_id", using: :btree
  add_index "articles", ["important_flag"], name: "index_articles_on_important_flag", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 255
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
