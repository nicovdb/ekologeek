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

ActiveRecord::Schema.define(version: 2018_11_15_111910) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "town"
    t.bigint "project_id"
    t.string "accepted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_companies_on_project_id"
  end

  create_table "company_know_hows", force: :cascade do |t|
    t.string "origin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dispositives", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "form_company_know_hows", force: :cascade do |t|
    t.bigint "form_id"
    t.bigint "company_know_how_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_know_how_id"], name: "index_form_company_know_hows_on_company_know_how_id"
    t.index ["form_id"], name: "index_form_company_know_hows_on_form_id"
  end

  create_table "form_dispositives", force: :cascade do |t|
    t.bigint "form_id"
    t.bigint "dispositive_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dispositive_id"], name: "index_form_dispositives_on_dispositive_id"
    t.index ["form_id"], name: "index_form_dispositives_on_form_id"
  end

  create_table "form_trash_providers", force: :cascade do |t|
    t.bigint "form_id"
    t.bigint "trash_provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_form_trash_providers_on_form_id"
    t.index ["trash_provider_id"], name: "index_form_trash_providers_on_trash_provider_id"
  end

  create_table "form_trash_working_types", force: :cascade do |t|
    t.bigint "form_id"
    t.bigint "trash_working_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_form_trash_working_types_on_form_id"
    t.index ["trash_working_type_id"], name: "index_form_trash_working_types_on_trash_working_type_id"
  end

  create_table "forms", force: :cascade do |t|
    t.bigint "company_id"
    t.string "company_activity"
    t.string "company_employees_nb"
    t.string "company_participant_nb"
    t.string "trash_indicator"
    t.text "trash_indicator_list"
    t.string "trash_types"
    t.string "trash_sorting"
    t.text "trash_sorting_types"
    t.string "trash_sorting_quality"
    t.string "trash_sorting_knowledge"
    t.string "structure_sensitivity"
    t.string "structure_environment_strategy"
    t.text "structure_environment_strategy_examples"
    t.string "structure_ecologic_approach"
    t.text "structure_concrete_actions"
    t.string "structure_direction_interest"
    t.text "structure_direction_interest_reasons"
    t.text "structure_expectations"
    t.string "employees_knowledge"
    t.string "employees_knowledge_interest"
    t.string "employees_propositions"
    t.text "employees_propositions_examples"
    t.text "employees_propositions_handled"
    t.string "employees_concerned"
    t.string "employees_engagement"
    t.string "employees_actions_work"
    t.string "employees_actions_home"
    t.string "referent_implication"
    t.string "referent_sorts"
    t.string "referent_accompany"
    t.string "referent_complications"
    t.string "referent_winner"
    t.string "referent_willing"
    t.string "referent_obligation"
    t.string "referent_obligation_feeling"
    t.string "referent_valorisation"
    t.string "referent_fun"
    t.string "referent_techniques"
    t.text "referent_techniques_examples"
    t.string "referent_actions_home"
    t.text "referent_actions_home_examples"
    t.text "referent_personal_reasons"
    t.text "referent_changes_wanted"
    t.text "referent_accompaniment_need"
    t.string "referent_sex"
    t.string "referent_age"
    t.string "referent_seniority"
    t.string "referent_service"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "charte", default: false
    t.boolean "cgv", default: false
    t.index ["company_id"], name: "index_forms_on_company_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "referents", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_referents_on_company_id"
    t.index ["user_id"], name: "index_referents_on_user_id"
  end

  create_table "trash_providers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trash_working_types", force: :cascade do |t|
    t.string "trash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.string "role"
    t.string "civility"
    t.string "first_name"
    t.string "last_name"
    t.string "telephone"
    t.boolean "newsletter_ekg", default: false
    t.boolean "newsletter_dzd", default: false
    t.boolean "deleted", default: false
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "companies", "projects"
  add_foreign_key "form_company_know_hows", "company_know_hows"
  add_foreign_key "form_company_know_hows", "forms"
  add_foreign_key "form_dispositives", "dispositives"
  add_foreign_key "form_dispositives", "forms"
  add_foreign_key "form_trash_providers", "forms"
  add_foreign_key "form_trash_providers", "trash_providers"
  add_foreign_key "form_trash_working_types", "forms"
  add_foreign_key "form_trash_working_types", "trash_working_types"
  add_foreign_key "forms", "companies"
  add_foreign_key "referents", "companies"
  add_foreign_key "referents", "users"
end
