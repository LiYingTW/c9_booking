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

ActiveRecord::Schema.define(version: 20150614172206) do

  create_table "announcements", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "bookname"
    t.string   "isbn"
    t.string   "coursename"
    t.integer  "price"
    t.integer  "price_single"
    t.integer  "price_team"
    t.integer  "team_limit"
    t.datetime "booking_deadline"
    t.integer  "state"
    t.integer  "price_booking"
    t.string   "comment"
    t.datetime "pay_deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture"
  end

  create_table "orders", force: true do |t|
    t.string   "user_id"
    t.integer  "book_id"
    t.integer  "pay"
    t.integer  "affect"
    t.integer  "delete_yn"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "account"
    t.string   "password"
    t.string   "name"
    t.string   "cell_phone"
    t.string   "email"
    t.integer  "email_yn"
    t.integer  "privilege"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
