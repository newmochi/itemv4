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

ActiveRecord::Schema.define(version: 20160125025137) do

  create_table "articles", force: :cascade do |t|
    t.string   "asciino"
    t.string   "category1"
    t.string   "category2"
    t.string   "servername"
    t.integer  "type_p1v2a9"
    t.integer  "os_w1x2"
    t.string   "osfullname"
    t.integer  "daisu"
    t.integer  "core"
    t.integer  "memgbyte"
    t.integer  "storagegbyte"
    t.string   "remark"
    t.string   "ownername"
    t.datetime "rev_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "location"
    t.string   "iops"
    t.integer  "balancer_use1no0"
    t.integer  "st1_fs"
    t.integer  "st2_rep"
    t.integer  "st3_mbps"
    t.integer  "bu1_type"
    t.integer  "bu2_interval"
    t.integer  "bu3_fullsize"
    t.integer  "bu4_diffsize"
  end

  create_table "members", force: :cascade do |t|
    t.integer  "number",                          null: false
    t.string   "name",                            null: false
    t.string   "full_name"
    t.string   "email"
    t.string   "remark"
    t.boolean  "administrator",   default: false, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "hashed_password"
  end

end
