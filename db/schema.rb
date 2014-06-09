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

ActiveRecord::Schema.define(:version => 20140609203218) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "appointments", :force => true do |t|
    t.integer  "patient_focus_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "appointment_host_id"
    t.datetime "date"
    t.integer  "dietitian_id"
    t.integer  "room_id"
    t.text     "note"
  end

  add_index "appointments", ["appointment_host_id"], :name => "index_appointments_on_appointment_host_id"
  add_index "appointments", ["date"], :name => "index_appointments_on_date"

  create_table "dietary_restrictions", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.boolean  "input_option"
    t.integer  "order"
    t.text     "description"
  end

  create_table "dietitians", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0,  :null => false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "dietitians", ["confirmation_token"], :name => "index_dietitians_on_confirmation_token", :unique => true
  add_index "dietitians", ["email"], :name => "index_dietitians_on_email", :unique => true
  add_index "dietitians", ["reset_password_token"], :name => "index_dietitians_on_reset_password_token", :unique => true
  add_index "dietitians", ["unlock_token"], :name => "index_dietitians_on_unlock_token", :unique => true

  create_table "families", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "head_of_family_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "families", ["head_of_family_id"], :name => "index_families_on_head_of_family_id"

  create_table "questions", :force => true do |t|
    t.integer  "survey_id"
    t.string   "answer_type"
    t.text     "content"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "question_order"
    t.hstore   "choices"
  end

  add_index "questions", ["survey_id"], :name => "index_questions_on_survey_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.string   "sessionId"
    t.boolean  "public"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "dietitian_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "surveys", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_dietary_restrictions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "dietary_restriction_id"
    t.text     "other_field"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "user_dietary_restrictions", ["dietary_restriction_id"], :name => "index_user_dietary_restrictions_on_dietary_restriction_id"
  add_index "user_dietary_restrictions", ["user_id"], :name => "index_user_dietary_restrictions_on_user_id"

  create_table "user_families", :force => true do |t|
    t.integer  "user_id"
    t.integer  "family_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_families", ["family_id"], :name => "index_user_families_on_family_id"
  add_index "user_families", ["user_id"], :name => "index_user_families_on_user_id"

  create_table "user_survey_answers", :force => true do |t|
    t.integer  "user_survey_id"
    t.integer  "question_id"
    t.text     "user_input"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.hstore   "choices"
  end

  add_index "user_survey_answers", ["question_id"], :name => "index_user_survey_answers_on_question_id"
  add_index "user_survey_answers", ["user_survey_id"], :name => "index_user_survey_answers_on_user_survey_id"

  create_table "user_surveys", :force => true do |t|
    t.integer  "user_id"
    t.integer  "survey_id"
    t.boolean  "completed",    :default => false
    t.datetime "completed_at"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "user_surveys", ["survey_id"], :name => "index_user_surveys_on_survey_id"
  add_index "user_surveys", ["user_id"], :name => "index_user_surveys_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.boolean  "rd"
    t.integer  "age_months"
    t.string   "sex"
    t.integer  "height_inches"
    t.integer  "weight_ounces"
    t.date     "birth_date"
    t.text     "more_info"
    t.boolean  "temp_flag",              :default => false
  end

  add_index "users", ["age_months"], :name => "index_users_on_age_months"
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["height_inches"], :name => "index_users_on_height_inches"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["weight_ounces"], :name => "index_users_on_weight_ounces"

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
