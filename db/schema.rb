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

ActiveRecord::Schema.define(version: 20151208110321) do

  create_table "addresses", force: :cascade do |t|
    t.string   "postcode",            null: false
    t.string   "new_address"
    t.string   "old_address"
    t.string   "detail_address"
    t.string   "english_address"
    t.integer  "business_license_id"
    t.integer  "station_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "addresses", ["business_license_id"], name: "index_addresses_on_business_license_id"
  add_index "addresses", ["station_id"], name: "index_addresses_on_station_id"

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index"
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index"
  add_index "audits", ["created_at"], name: "index_audits_on_created_at"
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid"
  add_index "audits", ["user_id", "user_type"], name: "user_index"

  create_table "bank_accounts", force: :cascade do |t|
    t.string   "bank_code"
    t.string   "account_number"
    t.text     "etc"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "business_licenses", force: :cascade do |t|
    t.string   "reg_number",      null: false
    t.string   "company_name",    null: false
    t.string   "director_name",   null: false
    t.string   "business_status"
    t.string   "business_item"
    t.integer  "business_type"
    t.integer  "company_id"
    t.string   "company_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "clients", force: :cascade do |t|
    t.integer  "settlement_period"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "title",            limit: 50, default: ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.string   "role",                        default: "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "freights", force: :cascade do |t|
    t.integer  "weight"
    t.integer  "quantity"
    t.text     "description"
    t.integer  "order_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "freights", ["order_id"], name: "index_freights_on_order_id"

  create_table "managers", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "fax"
    t.string   "position"
    t.integer  "client_id"
    t.integer  "station_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "managers", ["client_id"], name: "index_managers_on_client_id"
  add_index "managers", ["station_id"], name: "index_managers_on_station_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "status",             default: 0
    t.datetime "pickup_duedate"
    t.datetime "dropoff_duedate"
    t.integer  "sales"
    t.integer  "purchase"
    t.float    "truck_size"
    t.text     "etc"
    t.integer  "order_manager_id"
    t.integer  "charge_manager_id"
    t.integer  "freight_manager_id"
    t.integer  "source_id"
    t.integer  "destination_id"
    t.integer  "truck_driver_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "orders", ["charge_manager_id"], name: "index_orders_on_charge_manager_id"
  add_index "orders", ["destination_id"], name: "index_orders_on_destination_id"
  add_index "orders", ["freight_manager_id"], name: "index_orders_on_freight_manager_id"
  add_index "orders", ["order_manager_id"], name: "index_orders_on_order_manager_id"
  add_index "orders", ["source_id"], name: "index_orders_on_source_id"
  add_index "orders", ["truck_driver_id"], name: "index_orders_on_truck_driver_id"

  create_table "stations", force: :cascade do |t|
    t.string   "company_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
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
    t.string   "number",          null: false
    t.integer  "category",        null: false
    t.float    "size",            null: false
    t.float    "width"
    t.float    "depth"
    t.float    "height"
    t.integer  "truck_driver_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "trucks", ["truck_driver_id"], name: "index_trucks_on_truck_driver_id"

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true

end
