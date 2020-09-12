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

ActiveRecord::Schema.define(version: 2020_09_11_135934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.integer "ein"
    t.date "date_purchased_or_sold"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
    t.boolean "does_company_have_employees"
    t.string "qualified_plan_sponsored"
    t.string "entity_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "calendar_dates", id: :integer, default: nil, force: :cascade do |t|
    t.date "date_actual", null: false
    t.bigint "epoch", null: false
    t.string "day_suffix", null: false
    t.string "day_name", null: false
    t.integer "day_of_week", null: false
    t.integer "day_of_month", null: false
    t.integer "day_of_quarter", null: false
    t.integer "day_of_year", null: false
    t.integer "week_of_month", null: false
    t.integer "week_of_year", null: false
    t.string "week_of_year_iso", null: false
    t.integer "month_actual", null: false
    t.string "month_name", null: false
    t.string "month_name_short", null: false
    t.integer "quarter_actual", null: false
    t.string "quarter_name", null: false
    t.integer "year_actual", null: false
    t.date "first_day_of_week", null: false
    t.date "last_day_of_week", null: false
    t.date "first_day_of_month", null: false
    t.date "last_day_of_month", null: false
    t.date "first_day_of_quarter", null: false
    t.date "last_day_of_quarter", null: false
    t.date "first_day_of_year", null: false
    t.date "last_day_of_year", null: false
    t.boolean "weekend"
    t.datetime "created_at"
    t.index ["date_actual"], name: "index_calendar_dates_on_date_actual"
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.string "ein"
    t.date "fiscal_year_end"
    t.string "entity_type"
    t.string "naic_code"
    t.string "payroll_provider"
    t.string "payroll_frequency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "company_name"
    t.string "email"
    t.string "roles"
    t.string "rights"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "ssn"
    t.string "gender"
    t.date "date_of_birth"
    t.date "original_date_of_hire"
    t.date "date_of_termination"
    t.date "date_of_retire"
    t.string "compensation"
    t.integer "hours"
    t.string "pre_tax_salary_deferal"
    t.string "roth_salary_deferal"
    t.string "employee_match"
    t.string "company_division"
    t.boolean "union_employee"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "families", force: :cascade do |t|
    t.string "name"
    t.string "relationship"
    t.string "related_to"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fifty_five_hundreds", force: :cascade do |t|
    t.string "question1"
    t.string "question2"
    t.string "question3"
    t.string "question4"
    t.string "question5"
    t.string "question6"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "generals", force: :cascade do |t|
    t.string "address_type"
    t.string "address"
    t.string "contact_type"
    t.string "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string "question1"
    t.string "question2"
    t.string "question3"
    t.string "question4"
    t.string "question5"
    t.string "question6"
    t.string "question7"
    t.string "question8"
    t.string "question9"
    t.string "question10"
    t.string "question11"
    t.date "question12"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "principals", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.boolean "officer"
    t.integer "ownership"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scheduled_jobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "job_class"
    t.integer "frequency_quantity"
    t.string "frequency_period"
    t.string "at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "role", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
