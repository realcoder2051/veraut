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

ActiveRecord::Schema.define(version: 2020_11_04_192301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "address_mappings", force: :cascade do |t|
    t.bigint "address_id"
    t.bigint "address_type_id"
    t.boolean "active"
    t.integer "user_id"
    t.integer "task_id"
    t.boolean "is_completed", default: false
    t.index ["address_id"], name: "index_address_mappings_on_address_id"
    t.index ["address_type_id"], name: "index_address_mappings_on_address_type_id"
  end

  create_table "address_types", force: :cascade do |t|
    t.string "task_name"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.bigint "general_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "task_id"
    t.bigint "user_id"
    t.boolean "is_completed", default: false
    t.boolean "active", default: false
    t.index ["general_id"], name: "index_addresses_on_general_id"
    t.index ["task_id"], name: "index_addresses_on_task_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "approvals", force: :cascade do |t|
    t.date "date"
    t.boolean "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_approvals_on_user_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.integer "ein"
    t.date "date_purchased_or_sold"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
    t.string "does_company_have_employees"
    t.string "qualified_plan_sponsored"
    t.string "entity_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "task_id"
    t.bigint "user_id"
    t.boolean "is_completed", default: false
    t.boolean "active", default: false
    t.index ["task_id"], name: "index_businesses_on_task_id"
    t.index ["user_id"], name: "index_businesses_on_user_id"
  end

  create_table "change_request_mappings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
    t.boolean "is_requested", default: false
    t.integer "role_change_id"
    t.bigint "contact_change_request_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_change_request_id"], name: "index_change_request_mappings_on_contact_change_request_id"
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
    t.bigint "task_id"
    t.bigint "user_id"
    t.boolean "is_completed", default: false
    t.index ["task_id"], name: "index_companies_on_task_id"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "contact_change_requests", force: :cascade do |t|
    t.date "date"
    t.integer "created_by"
    t.string "change_request"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contact_numbers", force: :cascade do |t|
    t.string "number"
    t.string "contact_type"
    t.bigint "general_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "task_id"
    t.bigint "user_id"
    t.boolean "is_completed", default: false
    t.boolean "active", default: false
    t.index ["general_id"], name: "index_contact_numbers_on_general_id"
    t.index ["task_id"], name: "index_contact_numbers_on_task_id"
    t.index ["user_id"], name: "index_contact_numbers_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "company_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "task_id"
    t.boolean "is_completed", default: false
    t.integer "user_id"
    t.integer "role_id"
    t.index ["task_id"], name: "index_contacts_on_task_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.string "document_type"
    t.string "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_documents_on_user_id"
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
    t.boolean "is_new", default: true
    t.integer "status", default: 0
    t.bigint "task_id"
    t.boolean "is_completed", default: false
    t.boolean "active", default: false
    t.index ["task_id"], name: "index_employees_on_task_id"
  end

  create_table "families", force: :cascade do |t|
    t.string "name"
    t.string "relationship"
    t.string "related_to"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "task_id"
    t.bigint "user_id"
    t.boolean "is_completed", default: false
    t.boolean "active", default: false
    t.index ["task_id"], name: "index_families_on_task_id"
    t.index ["user_id"], name: "index_families_on_user_id"
  end

  create_table "feduciary_documents", force: :cascade do |t|
    t.string "plan"
    t.string "feduciary_document_type"
    t.string "description"
    t.date "effective_date"
    t.date "period_end"
    t.bigint "task_group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["task_group_id"], name: "index_feduciary_documents_on_task_group_id"
  end

  create_table "generals", force: :cascade do |t|
    t.string "address_type"
    t.string "address"
    t.string "contact_type"
    t.string "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notes", force: :cascade do |t|
    t.string "description"
    t.string "data_collection_step"
    t.string "created_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "task_id"
    t.index ["task_id"], name: "index_notes_on_task_id"
  end

  create_table "principals", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.boolean "officer"
    t.integer "ownership"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "task_id"
    t.bigint "user_id"
    t.boolean "is_completed", default: false
    t.boolean "active", default: false
    t.index ["task_id"], name: "index_principals_on_task_id"
    t.index ["user_id"], name: "index_principals_on_user_id"
  end

  create_table "question_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questionaire_answers", force: :cascade do |t|
    t.string "answer"
    t.integer "question_no"
    t.bigint "task_id"
    t.bigint "question_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.boolean "is_completed", default: false
    t.index ["question_type_id"], name: "index_questionaire_answers_on_question_type_id"
    t.index ["task_id"], name: "index_questionaire_answers_on_task_id"
    t.index ["user_id"], name: "index_questionaire_answers_on_user_id"
  end

  create_table "rights", force: :cascade do |t|
    t.string "right_type"
    t.bigint "role_id"
    t.bigint "roles_right_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_rights_on_role_id"
    t.index ["roles_right_id"], name: "index_rights_on_roles_right_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "roles_rights", force: :cascade do |t|
    t.bigint "role_id"
    t.json "role_type"
    t.index ["role_id"], name: "index_roles_rights_on_role_id"
  end

  create_table "task_groups", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_task_groups_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "task_name"
    t.bigint "task_group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "flag", default: false
    t.boolean "is_submitted", default: false
    t.json "steppers"
    t.index ["task_group_id"], name: "index_tasks_on_task_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
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
    t.bigint "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "approvals", "users"
  add_foreign_key "documents", "users"
  add_foreign_key "feduciary_documents", "task_groups"
end
