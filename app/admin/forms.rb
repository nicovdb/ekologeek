ActiveAdmin.register Form do
  config.filters = false
  actions :index, :show

  permit_params :company_id,
                :referent_id,
                :company_activity,
                :company_employees_nb,
                :company_participant_nb,
                :company_know_hows,
                :trash_providers,
                :trash_indicator,
                :trash_indicator_list,
                :trash_types,
                :trash_working_types,
                :trash_sorting,
                :trash_sorting_types,
                :trash_sorting_quality,
                :trash_sorting_knowledge,
                :structure_sensitivity,
                :structure_environment_strategy,
                :structure_environment_strategy_examples,
                :structure_ecologic_approach,
                :dispositives,
                :structure_concrete_actions,
                :structure_direction_interest,
                :structure_direction_interest_reasons,
                :structure_expectations,
                :employees_knowledge,
                :employees_knowledge_interest,
                :employees_propositions,
                :employees_propositions_examples,
                :employees_propositions_handled,
                :employees_concerned,
                :employees_engagement,
                :employees_actions_work,
                :employees_actions_home,
                :referent_implication,
                :referent_sorts,
                :referent_accompany,
                :referent_complications,
                :referent_winner,
                :referent_willing,
                :referent_obligation,
                :referent_obligation_feeling,
                :referent_valorisation,
                :referent_fun,
                :referent_techniques,
                :referent_techniques_examples,
                :referent_actions_home,
                :referent_actions_home_examples,
                :referent_personal_reasons,
                :referent_changes_wanted,
                :referent_accompaniment_need,
                :referent_sex,
                :referent_age,
                :referent_seniority,
                :referent_service,
                :charte,
                :cgv,
                :company_infos,
                :trash_gestion,
                :company_willing,
                :employees_willing,
                :referent_willing_validation,
                :charte_validation,
                :confidentiality

   index do
    selectable_column
    id_column
      column :company
      column :referent
      column :company_infos
      column :trash_gestion
      column :company_willing
      column :employees_willing
      column :referent_willing_validation
      column :charte_validation
      column :company_activity
      column :company_employees_nb
      column :company_participant_nb
      column(:company_know_hows) { |form| form.company_know_hows.map { |ckh| ckh.origin }}
      column(:trash_providers) { |form| form.trash_providers.map { |tp| tp.name }}
      column :trash_indicator
      column :trash_indicator_list
      column :trash_types
      column(:trash_working_types) { |form| form.trash_working_types.map { |twt| twt.trash }}
      column :trash_sorting
      column :trash_sorting_types
      column :trash_sorting_quality
      column :trash_sorting_knowledge
      column :structure_sensitivity
      column :structure_environment_strategy
      column :structure_environment_strategy_examples
      column :structure_ecologic_approach
      column(:dispositives) { |form| form.dispositives.map { |d| d.name }}
      column :structure_concrete_actions
      column :structure_direction_interest
      column :structure_direction_interest_reasons
      column :structure_expectations
      column :employees_knowledge
      column :employees_knowledge_interest
      column :employees_propositions
      column :employees_propositions_examples
      column :employees_propositions_handled
      column :employees_concerned
      column :employees_engagement
      column :employees_actions_work
      column :employees_actions_home
      column :referent_implication
      column :referent_sorts
      column :referent_accompany
      column :referent_complications
      column :referent_winner
      column :referent_willing
      column :referent_obligation
      column :referent_obligation_feeling
      column :referent_valorisation
      column :referent_fun
      column :referent_techniques
      column :referent_techniques_examples
      column :referent_actions_home
      column :referent_actions_home_examples
      column :referent_personal_reasons
      column :referent_changes_wanted
      column :referent_accompaniment_need
      column :referent_sex
      column :referent_age
      column :referent_seniority
      column :referent_service
      column :charte
      column :cgv
      column :confidentiality

    actions
  end

  show do
    attributes_table do
      row :company
      row :referent
      row :company_infos
      row :trash_gestion
      row :company_willing
      row :employees_willing
      row :referent_willing_validation
      row :charte_validation
      row :company_activity
      row :company_employees_nb
      row :company_participant_nb
      row(:company_know_hows) { |form| form.company_know_hows.map { |ckh| ckh.origin }}
      row(:trash_providers) { |form| form.trash_providers.map { |tp| tp.name }}
      row :trash_indicator
      row :trash_indicator_list
      row :trash_types
      row(:trash_working_types) { |form| form.trash_working_types.map { |twt| twt.trash }}
      row :trash_sorting
      row :trash_sorting_types
      row :trash_sorting_quality
      row :trash_sorting_knowledge
      row :structure_sensitivity
      row :structure_environment_strategy
      row :structure_environment_strategy_examples
      row :structure_ecologic_approach
      row(:dispositives) { |form| form.dispositives.map { |d| d.name }}
      row :structure_concrete_actions
      row :structure_direction_interest
      row :structure_direction_interest_reasons
      row :structure_expectations
      row :employees_knowledge
      row :employees_knowledge_interest
      row :employees_propositions
      row :employees_propositions_examples
      row :employees_propositions_handled
      row :employees_concerned
      row :employees_engagement
      row :employees_actions_work
      row :employees_actions_home
      row :referent_implication
      row :referent_sorts
      row :referent_accompany
      row :referent_complications
      row :referent_winner
      row :referent_willing
      row :referent_obligation
      row :referent_obligation_feeling
      row :referent_valorisation
      row :referent_fun
      row :referent_techniques
      row :referent_techniques_examples
      row :referent_actions_home
      row :referent_actions_home_examples
      row :referent_personal_reasons
      row :referent_changes_wanted
      row :referent_accompaniment_need
      row :referent_sex
      row :referent_age
      row :referent_seniority
      row :referent_service
      row :charte
      row :cgv
      row :confidentiality
    end
  end
end
