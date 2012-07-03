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

ActiveRecord::Schema.define(:version => 20120703015900) do

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "admintitle"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "pro_type"
    t.string   "name"
    t.text     "descrip",                                   :default => "Discription to come"
    t.string   "pro_image",                                 :default => "comingsoon.png"
    t.decimal  "price",      :precision => 10, :scale => 2
    t.decimal  "sprice",     :precision => 10, :scale => 2
    t.string   "spec"
    t.datetime "created_at",                                                                   :null => false
    t.datetime "updated_at",                                                                   :null => false
  end

  create_table "staffs", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "bio",        :default => "Bio to come"
    t.string   "image",      :default => "comingsoon.png"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
