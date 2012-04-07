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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120406060526) do

  create_table "after_school_programs", :force => true do |t|
    t.string   "day"
    t.string   "program_name"
    t.string   "price"
    t.string   "status"
    t.string   "dates"
    t.string   "payable_to"
    t.string   "campus"
    t.text     "notes"
    t.integer  "max_registrants"
    t.integer  "min_registrants"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "asp_registrations", :force => true do |t|
    t.integer  "child_id"
    t.integer  "after_school_program_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "challahs", :force => true do |t|
    t.string   "campus"
    t.string   "type"
    t.string   "price"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "children", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "health_card"
    t.string   "grade"
    t.string   "child_class"
    t.string   "campus"
    t.string   "shoe_size"
    t.string   "emergency_first_name"
    t.string   "emergency_last_name"
    t.string   "emergency_phone"
    t.integer  "user_id"
    t.text     "medical"
    t.text     "pickup_info"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "lunch_items", :force => true do |t|
    t.string   "item_name"
    t.string   "option_name"
    t.string   "dates"
    t.string   "campus"
    t.string   "vendor"
    t.string   "day"
    t.string   "price"
    t.string   "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mother_first_name"
    t.string   "mother_last_name"
    t.string   "mother_email"
    t.string   "mother_work_phone"
    t.string   "mother_home_phone"
    t.string   "father_first_name"
    t.string   "father_last_name"
    t.string   "father_email"
    t.string   "father_work_phone"
    t.string   "father_home_phone"
    t.string   "address"
    t.string   "city"
    t.string   "postal_code"
    t.string   "username"
    t.string   "campus"
    t.string   "remember_token"
    t.string   "password_digest"
    t.boolean  "teacher",           :default => false
    t.boolean  "admin",             :default => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "volunteer_programs", :force => true do |t|
    t.string   "program_name"
    t.string   "dates"
    t.string   "status"
    t.integer  "max_registrants"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
