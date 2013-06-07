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

ActiveRecord::Schema.define(:version => 20130607193712) do

  create_table "app_requests", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "company"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "send_question_day_of_week"
    t.time     "send_question_time"
    t.integer  "send_reminder_day_of_week"
    t.time     "send_reminder_time"
    t.integer  "send_rollup_day_of_week"
    t.time     "send_rollup_time"
  end

  create_table "questions", :force => true do |t|
    t.text     "question_text"
    t.integer  "week_id"
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "ask_at"
    t.datetime "remind_at"
    t.datetime "send_roll_up_at"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.boolean  "send_question",   :default => true
    t.boolean  "send_reminder",   :default => true
    t.boolean  "send_rollup",     :default => true
  end

  create_table "responses", :force => true do |t|
    t.integer  "user_id"
    t.text     "response_text"
    t.integer  "question_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.boolean  "yes_response"
    t.boolean  "public_response", :default => true
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_role"
    t.integer  "company_id"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "avatar"
  end

  create_table "weeks", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
