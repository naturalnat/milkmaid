# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_19_054008) do

  create_table "milks", force: :cascade do |t|
    t.string "milktype"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "milk_id"
    t.string "name"
    t.string "frequency"
    t.string "size"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "stars"
    t.string "title"
    t.string "content"
    t.integer "milk_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "provider"
    t.string "uid"
  end

end
