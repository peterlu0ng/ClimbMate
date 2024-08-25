# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_08_17_024535) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "event_id", null: false
    t.uuid "user_id", null: false
    t.integer "attendance_status", null: false
    t.index ["event_id"], name: "index_attendances_on_event_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description"
    t.integer "status", null: false
    t.datetime "open_time"
    t.datetime "close_time"
    t.uuid "gym_id"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gym_id"], name: "index_events_on_gym_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "gyms", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "address", default: "", null: false
    t.jsonb "operating_hours", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_a_id", null: false
    t.uuid "user_b_id", null: false
    t.integer "status", null: false
    t.index ["user_a_id", "user_b_id"], name: "index_relationships_on_user_a_id_and_user_b_id", unique: true
    t.index ["user_a_id"], name: "index_relationships_on_user_a_id"
    t.index ["user_b_id"], name: "index_relationships_on_user_b_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "username", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attendances", "events", on_delete: :cascade
  add_foreign_key "attendances", "users", on_delete: :cascade
  add_foreign_key "events", "gyms", on_delete: :cascade
  add_foreign_key "events", "users", on_delete: :cascade
  add_foreign_key "relationships", "users", column: "user_a_id"
  add_foreign_key "relationships", "users", column: "user_b_id"
end
