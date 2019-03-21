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

ActiveRecord::Schema.define(version: 2019_03_21_182117) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "account_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "registration_status_id", default: 1
  end

  create_table "freelancers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "skills"
    t.string "specialization"
    t.text "description"
    t.text "resume"
    t.integer "user_id"
    t.integer "account_id"
    t.integer "panel_id"
    t.string "first_name"
    t.string "last_name"
  end

  create_table "job_panels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "job_id"
    t.integer "user_id"
  end

  create_table "job_rooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "job_id"
    t.integer "user_id"
    t.string "authorization_code"
  end

  create_table "job_statuses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "current_job_status"
  end

  create_table "jobs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "job_title"
    t.string "job_description"
    t.string "job_skills"
    t.integer "recruiter_id"
    t.integer "rate"
    t.string "position"
    t.integer "job_status_id", default: 1
    t.text "objectives"
    t.integer "user_id"
  end

  create_table "panels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "account_id"
  end

  create_table "public_profiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "recruiters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "company"
    t.string "company_description"
    t.string "resume"
    t.integer "user_id"
    t.integer "account_id"
    t.integer "panel_id"
  end

  create_table "registration_statuses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reg_status"
  end

  create_table "request_statuses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "req_status"
  end

  create_table "requests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "freelancer_id"
    t.integer "request_status_id", default: 1
    t.string "request_description"
    t.integer "job_id"
    t.integer "recruiter_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "registration_status_id", default: 1
    t.boolean "admin", default: false, null: false
    t.integer "account_type", default: 1
    t.boolean "is_recruiter", default: false, null: false
    t.boolean "is_freelancer", default: false, null: false
    t.string "authorization_code"
    t.string "second_authorization_code"
    t.string "third_authorization_code"
    t.string "fourth_authorization_code"
    t.integer "current_active_jobs_count", default: 4
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
