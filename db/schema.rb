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

ActiveRecord::Schema.define(version: 20160215195018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string   "visa_name"
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
