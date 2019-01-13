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

ActiveRecord::Schema.define(version: 2019_01_11_142321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_mades", force: :cascade do |t|
    t.string "action"
    t.bigint "user_behaviour_result_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_behaviour_result_id"], name: "index_action_mades_on_user_behaviour_result_id"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "app_reasons", force: :cascade do |t|
    t.string "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "public", default: false
  end

  create_table "bin_types", force: :cascade do |t|
    t.string "name"
    t.float "density"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bins", force: :cascade do |t|
    t.bigint "company_id"
    t.integer "volume"
    t.string "collector"
    t.boolean "shared"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "frequency_number"
    t.string "frequency_periodicity"
    t.string "frequency_day"
    t.bigint "bin_type_id"
    t.index ["bin_type_id"], name: "index_bins_on_bin_type_id"
    t.index ["company_id"], name: "index_bins_on_company_id"
  end

  create_table "collects", force: :cascade do |t|
    t.bigint "bin_id"
    t.date "start_at"
    t.date "end_at"
    t.float "filled_rate"
    t.text "comment"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "weight_person_day"
    t.index ["bin_id"], name: "index_collects_on_bin_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "town"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "usage_acceptance", default: false
    t.boolean "accepted", default: false, null: false
    t.index ["project_id"], name: "index_companies_on_project_id"
  end

  create_table "company_behaviours", force: :cascade do |t|
    t.bigint "company_id"
    t.integer "participants_nb"
    t.string "employees_sensitized"
    t.text "employees_sensitized_comment"
    t.string "actions_displayed"
    t.string "strategic_display"
    t.text "strategic_display_comment"
    t.string "newbies_sensitized"
    t.text "newbies_sensitized_comment"
    t.string "indicators_communicated"
    t.text "indicators_communicated_comment"
    t.string "daily_actions_diag"
    t.string "status"
    t.string "actions_nb_result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "step_one", default: false
    t.boolean "step_two", default: false
    t.boolean "step_three", default: false
    t.index ["company_id"], name: "index_company_behaviours_on_company_id"
  end

  create_table "company_know_hows", force: :cascade do |t|
    t.string "origin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diag_actions", force: :cascade do |t|
    t.string "action"
    t.bigint "company_behaviour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "diag_action_comment"
    t.index ["company_behaviour_id"], name: "index_diag_actions_on_company_behaviour_id"
  end

  create_table "diag_app_reasons", force: :cascade do |t|
    t.bigint "app_reason_id"
    t.bigint "user_behaviour_diag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_reason_id"], name: "index_diag_app_reasons_on_app_reason_id"
    t.index ["user_behaviour_diag_id"], name: "index_diag_app_reasons_on_user_behaviour_diag_id"
  end

  create_table "diag_no_ap_reasons", force: :cascade do |t|
    t.bigint "no_app_reason_id"
    t.bigint "user_behaviour_diag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["no_app_reason_id"], name: "index_diag_no_ap_reasons_on_no_app_reason_id"
    t.index ["user_behaviour_diag_id"], name: "index_diag_no_ap_reasons_on_user_behaviour_diag_id"
  end

  create_table "diag_no_app_reasons", force: :cascade do |t|
    t.bigint "no_app_reason_id"
    t.bigint "user_behaviour_diag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["no_app_reason_id"], name: "index_diag_no_app_reasons_on_no_app_reason_id"
    t.index ["user_behaviour_diag_id"], name: "index_diag_no_app_reasons_on_user_behaviour_diag_id"
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
    t.boolean "company_infos", default: false
    t.boolean "trash_gestion", default: false
    t.boolean "company_willing", default: false
    t.boolean "employees_willing", default: false
    t.boolean "referent_willing_validation", default: false
    t.boolean "charte_validation", default: false
    t.boolean "confidentiality", default: false
    t.index ["company_id"], name: "index_forms_on_company_id"
  end

  create_table "no_action_mades", force: :cascade do |t|
    t.string "action"
    t.bigint "user_behaviour_result_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_behaviour_result_id"], name: "index_no_action_mades_on_user_behaviour_result_id"
  end

  create_table "no_app_reasons", force: :cascade do |t|
    t.string "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "public", default: false
  end

  create_table "not_made_reasons", force: :cascade do |t|
    t.string "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "public", default: false
  end

  create_table "priority_actions", force: :cascade do |t|
    t.bigint "user_behaviour_diag_id"
    t.integer "priority_level"
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_behaviour_diag_id"], name: "index_priority_actions_on_user_behaviour_diag_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "diagnostic_end_at"
    t.date "bilan_start_at"
  end

  create_table "referents", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_referents_on_company_id"
    t.index ["user_id"], name: "index_referents_on_user_id"
  end

  create_table "result_actions", force: :cascade do |t|
    t.bigint "company_behaviour_id"
    t.string "name"
    t.text "comment"
    t.string "state"
    t.text "state_comment"
    t.string "domain"
    t.text "domain_comment"
    t.integer "employees_making_nb"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_behaviour_id"], name: "index_result_actions_on_company_behaviour_id"
  end

  create_table "result_not_made_reasons", force: :cascade do |t|
    t.bigint "user_behaviour_result_id"
    t.bigint "not_made_reason_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["not_made_reason_id"], name: "index_result_not_made_reasons_on_not_made_reason_id"
    t.index ["user_behaviour_result_id"], name: "index_result_not_made_reasons_on_user_behaviour_result_id"
  end

  create_table "trash_bins", force: :cascade do |t|
    t.bigint "trash_id"
    t.bigint "bin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bin_id"], name: "index_trash_bins_on_bin_id"
    t.index ["trash_id"], name: "index_trash_bins_on_trash_id"
  end

  create_table "trash_diagnostics", force: :cascade do |t|
    t.integer "annual_cost"
    t.float "reduction_objective"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "employees_nb"
    t.index ["company_id"], name: "index_trash_diagnostics_on_company_id"
  end

  create_table "trash_providers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trash_result_actions", force: :cascade do |t|
    t.bigint "trash_id"
    t.bigint "result_action_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["result_action_id"], name: "index_trash_result_actions_on_result_action_id"
    t.index ["trash_id"], name: "index_trash_result_actions_on_trash_id"
  end

  create_table "trash_working_types", force: :cascade do |t|
    t.string "trash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trashes", force: :cascade do |t|
    t.string "name"
    t.integer "density"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "display", default: false
  end

  create_table "user_behaviour_diags", force: :cascade do |t|
    t.bigint "user_id"
    t.string "work_sorting_order"
    t.string "work_sorting_applied"
    t.string "work_trash_reduction"
    t.text "work_trash_reduction_comment"
    t.string "home_sorting_order"
    t.string "home_sorting_applied"
    t.string "home_trash_reduction"
    t.text "home_trash_reduction_comment"
    t.string "context_knowledge"
    t.text "context_knowledge_comment"
    t.string "concerned"
    t.string "trash_reduction_hard"
    t.string "dedicated_employee"
    t.boolean "want_to_help", default: false
    t.text "no_app_reason_comment"
    t.text "app_reason_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "page_one", default: false
    t.boolean "page_two", default: false
    t.boolean "page_three", default: false
    t.boolean "page_four", default: false
    t.boolean "page_five", default: false
    t.string "favorable_reduction"
    t.string "crappy_reduction"
    t.string "sexe"
    t.integer "age"
    t.integer "seniority"
    t.index ["user_id"], name: "index_user_behaviour_diags_on_user_id"
  end

  create_table "user_behaviour_results", force: :cascade do |t|
    t.bigint "user_id"
    t.string "starting_month"
    t.text "actions_made_reasons"
    t.string "work_sorting_order"
    t.string "work_sorting_applied"
    t.string "work_trash_reduction"
    t.text "work_trash_reduction_comment"
    t.string "new_actions"
    t.text "new_actions_comment"
    t.string "more_actions"
    t.text "more_actions_comment"
    t.string "better_actions"
    t.text "better_actions_comment"
    t.string "context_knowledge"
    t.text "context_knowledge_comment"
    t.string "concerned"
    t.text "concerned_comment"
    t.string "trash_reduction_hard"
    t.text "trash_reduction_hard_comment"
    t.string "dedicated_employee"
    t.text "dedicated_employee_comment"
    t.string "work_continue"
    t.text "work_continue_comment"
    t.string "home_continue"
    t.text "home_continue_comment"
    t.string "accompanier"
    t.text "accompanier_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "page_one", default: false
    t.boolean "page_two", default: false
    t.boolean "page_three", default: false
    t.boolean "page_four", default: false
    t.boolean "page_five", default: false
    t.boolean "page_six", default: false
    t.string "actions_not_made_comment"
    t.string "favorable_reduction"
    t.string "crappy_reduction"
    t.index ["user_id"], name: "index_user_behaviour_results_on_user_id"
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
    t.boolean "admin", default: false, null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "sign_in_count", default: 0, null: false
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "action_mades", "user_behaviour_results"
  add_foreign_key "bins", "bin_types"
  add_foreign_key "bins", "companies"
  add_foreign_key "collects", "bins"
  add_foreign_key "companies", "projects"
  add_foreign_key "company_behaviours", "companies"
  add_foreign_key "diag_actions", "company_behaviours"
  add_foreign_key "diag_app_reasons", "app_reasons"
  add_foreign_key "diag_app_reasons", "user_behaviour_diags"
  add_foreign_key "diag_no_ap_reasons", "no_app_reasons"
  add_foreign_key "diag_no_ap_reasons", "user_behaviour_diags"
  add_foreign_key "diag_no_app_reasons", "no_app_reasons"
  add_foreign_key "diag_no_app_reasons", "user_behaviour_diags"
  add_foreign_key "form_company_know_hows", "company_know_hows"
  add_foreign_key "form_company_know_hows", "forms"
  add_foreign_key "form_dispositives", "dispositives"
  add_foreign_key "form_dispositives", "forms"
  add_foreign_key "form_trash_providers", "forms"
  add_foreign_key "form_trash_providers", "trash_providers"
  add_foreign_key "form_trash_working_types", "forms"
  add_foreign_key "form_trash_working_types", "trash_working_types"
  add_foreign_key "forms", "companies"
  add_foreign_key "no_action_mades", "user_behaviour_results"
  add_foreign_key "priority_actions", "user_behaviour_diags"
  add_foreign_key "referents", "companies"
  add_foreign_key "referents", "users"
  add_foreign_key "result_actions", "company_behaviours"
  add_foreign_key "result_not_made_reasons", "not_made_reasons"
  add_foreign_key "result_not_made_reasons", "user_behaviour_results"
  add_foreign_key "trash_bins", "bins"
  add_foreign_key "trash_bins", "trashes"
  add_foreign_key "trash_diagnostics", "companies"
  add_foreign_key "trash_result_actions", "result_actions"
  add_foreign_key "trash_result_actions", "trashes"
  add_foreign_key "user_behaviour_diags", "users"
  add_foreign_key "user_behaviour_results", "users"
end
