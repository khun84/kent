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

ActiveRecord::Schema.define(version: 2019_12_13_140554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities_feeds", force: :cascade do |t|
    t.string "detail"
    t.integer "activity_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bills", force: :cascade do |t|
    t.bigint "service_request_id"
    t.jsonb "tasks", default: []
    t.jsonb "materials", default: []
    t.datetime "paid_at"
    t.datetime "due_at"
    t.integer "status"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "premises", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "organization_id"
    t.string "name"
    t.string "address"
    t.jsonb "notes", default: []
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_areas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_requests", force: :cascade do |t|
    t.bigint "premise_id"
    t.bigint "user_id"
    t.datetime "require_at"
    t.datetime "completed_at"
    t.integer "status"
    t.bigint "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "service_type_id"
    t.integer "service_area_id"
  end

  create_table "service_types", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "role"
    t.bigint "organization_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.boolean "primary"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
