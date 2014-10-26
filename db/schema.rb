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

ActiveRecord::Schema.define(version: 20141026093137) do

  create_table "talents", force: true do |t|
    t.string   "office"
    t.string   "name"
    t.string   "nickname"
    t.string   "profile_image"
    t.string   "sex"
    t.string   "birthday"
    t.string   "bloodtype"
    t.string   "hometown"
    t.string   "height"
    t.string   "ability"
    t.string   "hobby"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "talents", ["ability"], name: "index_talents_on_ability"
  add_index "talents", ["birthday"], name: "index_talents_on_birthday"
  add_index "talents", ["bloodtype"], name: "index_talents_on_bloodtype"
  add_index "talents", ["height"], name: "index_talents_on_height"
  add_index "talents", ["hobby"], name: "index_talents_on_hobby"
  add_index "talents", ["hometown"], name: "index_talents_on_hometown"
  add_index "talents", ["name"], name: "index_talents_on_name"
  add_index "talents", ["nickname"], name: "index_talents_on_nickname"
  add_index "talents", ["office"], name: "index_talents_on_office"
  add_index "talents", ["profile_image"], name: "index_talents_on_profile_image"
  add_index "talents", ["sex"], name: "index_talents_on_sex"

end
