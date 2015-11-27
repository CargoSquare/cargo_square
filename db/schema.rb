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

ActiveRecord::Schema.define(version: 20151127061831) do

  create_table "bank_accounts", force: :cascade do |t|
    t.string   "bank_code"
    t.string   "account_number"
    t.text     "etc"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "truck_drivers", force: :cascade do |t|
    t.string   "name",                null: false
    t.string   "email"
    t.string   "phone_number"
    t.integer  "trucking_company_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "truck_drivers", ["trucking_company_id"], name: "index_truck_drivers_on_trucking_company_id"

  create_table "trucking_companies", force: :cascade do |t|
    t.string   "account"
    t.integer  "settlement_period"
    t.string   "campany_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "trucks", force: :cascade do |t|
    t.string   "truck_number",    null: false
    t.string   "truck_type",      null: false
    t.float    "truck_size",      null: false
    t.float    "truck_width"
    t.float    "truck_depth"
    t.float    "truck_height"
    t.integer  "truck_driver_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "trucks", ["truck_driver_id"], name: "index_trucks_on_truck_driver_id"

end
