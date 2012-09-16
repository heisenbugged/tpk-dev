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

ActiveRecord::Schema.define(:version => 20120913232826) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "addresses", :force => true do |t|
    t.string   "street_line_1"
    t.string   "street_line_2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "affiliates", :force => true do |t|
    t.string   "company_name"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "bonded"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "website_url"
    t.string   "logo"
    t.string   "state",        :default => "active"
    t.string   "email"
  end

  create_table "certificates", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "certificates_skills", :id => false, :force => true do |t|
    t.integer "certificate_id"
    t.integer "skill_id"
  end

  create_table "certifications", :force => true do |t|
    t.integer "affiliate_id"
    t.integer "certificate_id"
  end

  create_table "customers", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "it_services", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "it_services_skills", :id => false, :force => true do |t|
    t.integer "it_service_id"
    t.integer "skill_id"
  end

  create_table "phones", :force => true do |t|
    t.string   "number"
    t.string   "ph_type"
    t.integer  "phoneable_id"
    t.string   "phoneable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "problem_categories", :force => true do |t|
    t.string   "category_name"
    t.string   "css_class"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "problem_categories_problem_requests", :id => false, :force => true do |t|
    t.integer "problem_category_id"
    t.integer "problem_request_id"
  end

  create_table "problem_details", :force => true do |t|
    t.string   "name"
    t.integer  "problem_category_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "problem_details_problem_requests", :id => false, :force => true do |t|
    t.integer "problem_detail_id"
    t.integer "problem_request_id"
  end

  create_table "problem_details_skills", :id => false, :force => true do |t|
    t.integer "problem_detail_id"
    t.integer "skill_id"
  end

  create_table "problem_requests", :force => true do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "phone"
    t.integer  "zip"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "referrals", :force => true do |t|
    t.string   "zip_code"
    t.date     "date_referred"
    t.datetime "time_referred"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "reviewers", :force => true do |t|
    t.string   "name"
    t.string   "email_address"
    t.boolean  "verified"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "reviews", :force => true do |t|
    t.date     "date"
    t.integer  "rating"
    t.string   "comments"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "service_sets", :force => true do |t|
    t.integer "affiliate_id"
    t.integer "it_service_id"
  end

  create_table "skill_sets", :force => true do |t|
    t.integer "affiliate_id"
    t.integer "skill_id"
  end

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
