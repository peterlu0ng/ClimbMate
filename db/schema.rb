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

ActiveRecord::Schema[7.1].define(version: 20_240_817_024_535) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum 'friendship_status', %w[Friends Blocked]
  create_enum 'status', ['Going', 'Maybe', "Can't Go"]
  create_enum 'type', ['public', 'private', 'friends only']

  create_table 'attendances', force: :cascade do |t|
    t.bigint 'event_id', null: false
    t.bigint 'user_id', null: false
    t.enum 'attendance_status', null: false, enum_type: 'status'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_attendances_on_event_id'
    t.index ['user_id'], name: 'index_attendances_on_user_id'
  end

  create_table 'events', force: :cascade do |t|
    t.string 'name', default: '', null: false
    t.string 'description'
    t.enum 'event_type', null: false, enum_type: 'type'
    t.datetime 'open_time'
    t.datetime 'close_time'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'gyms', force: :cascade do |t|
    t.string 'name', default: '', null: false
    t.string 'address', default: '', null: false
    t.jsonb 'operating_hours', default: {}, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'relationships', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'friend_id', null: false
    t.enum 'friendship', null: false, enum_type: 'friendship_status'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['friend_id'], name: 'index_relationships_on_friend_id'
    t.index %w[user_id friend_id], name: 'index_relationships_on_user_id_and_friend_id', unique: true
    t.index ['user_id'], name: 'index_relationships_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'username', null: false
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'attendances', 'events'
  add_foreign_key 'attendances', 'users'
  add_foreign_key 'relationships', 'users'
  add_foreign_key 'relationships', 'users', column: 'friend_id'
end
