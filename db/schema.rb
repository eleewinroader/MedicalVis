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

ActiveRecord::Schema.define(:version => 20140226042616) do

  create_table "diseases", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dpcs", :force => true do |t|
    t.integer  "disease_id"
    t.integer  "hospital_id"
    t.integer  "year"
    t.float    "hospital_days"
    t.integer  "patient_count"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "dpcs", ["disease_id", "hospital_id"], :name => "index_dpcs_on_disease_id_and_hospital_id"
  add_index "dpcs", ["disease_id", "year"], :name => "index_dpcs_on_disease_id_and_year"
  add_index "dpcs", ["disease_id"], :name => "index_dpcs_on_disease_id"
  add_index "dpcs", ["hospital_id"], :name => "index_dpcs_on_hospital_id"
  add_index "dpcs", ["year"], :name => "index_dpcs_on_year"

  create_table "hospitals", :force => true do |t|
    t.integer  "prefecture_id"
    t.string   "name"
    t.string   "postcode"
    t.string   "address"
    t.string   "phone"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "hospitals", ["prefecture_id"], :name => "index_hospitals_on_prefecture_id"

  create_table "prefectures", :force => true do |t|
    t.integer  "region_id"
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "prefectures", ["region_id"], :name => "index_prefectures_on_region_id"

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
