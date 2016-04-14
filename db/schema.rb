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

ActiveRecord::Schema.define(version: 20160229201259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "applicable_rule_possible_answers", force: :cascade do |t|
    t.integer  "possible_answer_id"
    t.integer  "applicable_rule_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "applicable_rule_possible_answers", ["applicable_rule_id"], name: "index_applicable_rule_possible_answers_on_applicable_rule_id", using: :btree
  add_index "applicable_rule_possible_answers", ["possible_answer_id"], name: "index_applicable_rule_possible_answers_on_possible_answer_id", using: :btree

  create_table "applicable_rule_visas", force: :cascade do |t|
    t.integer  "visa_id"
    t.integer  "applicable_rule_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "applicable_rule_visas", ["applicable_rule_id"], name: "index_applicable_rule_visas_on_applicable_rule_id", using: :btree
  add_index "applicable_rule_visas", ["visa_id"], name: "index_applicable_rule_visas_on_visa_id", using: :btree

  create_table "applicable_rules", force: :cascade do |t|
    t.text     "criteria_content"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "possible_answers", force: :cascade do |t|
    t.string   "content"
    t.integer  "question_id"
    t.integer  "following_question_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "possible_answers", ["following_question_id"], name: "index_possible_answers_on_following_question_id", using: :btree
  add_index "possible_answers", ["question_id"], name: "index_possible_answers_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.string   "format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_answers", force: :cascade do |t|
    t.integer  "possible_answer_id"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "user_answers", ["possible_answer_id"], name: "index_user_answers_on_possible_answer_id", using: :btree
  add_index "user_answers", ["user_id"], name: "index_user_answers_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visas", force: :cascade do |t|
    t.string   "name"
    t.string   "scenario"
    t.integer  "coefficient_easy_to_get"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_foreign_key "applicable_rule_possible_answers", "applicable_rules"
  add_foreign_key "applicable_rule_possible_answers", "possible_answers"
  add_foreign_key "applicable_rule_visas", "applicable_rules"
  add_foreign_key "applicable_rule_visas", "visas"
  add_foreign_key "possible_answers", "questions"
  add_foreign_key "user_answers", "possible_answers"
  add_foreign_key "user_answers", "users"
end
