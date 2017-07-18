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

ActiveRecord::Schema.define(version: 20170706183845) do

  create_table "delinquencies", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maintanence_services", force: :cascade do |t|
    t.string   "location"
    t.string   "maintanence_type"
    t.string   "desc"
    t.datetime "time"
    t.boolean  "emergency"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.integer  "unit_id"
    t.index ["unit_id"], name: "index_maintanence_services_on_unit_id"
    t.index ["user_id"], name: "index_maintanence_services_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string   "title"
    t.string   "utilizes_type"
    t.integer  "utilizes_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "st_add"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.index ["utilizes_type", "utilizes_id"], name: "index_properties_on_utilizes_type_and_utilizes_id"
    t.index [nil], name: "index_properties_on_utilizing_property_id"
  end

  create_table "property_owner_workspaces", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resource_lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string   "address2"
    t.integer  "property_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "rental_fee"
    t.integer  "sq_ft"
    t.integer  "bdrms"
    t.integer  "baths"
    t.integer  "fl_lvl"
    t.boolean  "garage_strg"
    t.index ["property_id"], name: "index_units_on_property_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "phone"
    t.string   "type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "email"
    t.integer  "unit_id"
  end

  create_table "workspace_property_owners", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workspace_tenant_workspaces", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
