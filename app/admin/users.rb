ActiveAdmin.register User do

  permit_params :email,
                :first_name,
                :last_name,
                :role,
                :civility,
                :telephone,
                :newsletter_ekg,
                :newsletter_dzd,
                :deleted,
                :admin,
                :password,
                :company_id

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :company_id
    column :role
    column :civility
    column :telephone
    column :newsletter_ekg
    column :newsletter_dzd
    column :deleted
    column :admin
    actions
  end



  show do
    attributes_table do
      row :email
      row :first_name
      row :last_name
      row :company_id
      row :role
      row :civility
      row :telephone
      row :newsletter_ekg
      row :newsletter_dzd
      row :deleted
      row :admin
    end

    panel "Entreprise de l'utilisateur" do
      table_for user.company do
        column :name
        column :town
      end
    end

    panel "formulaire" do
      table_for user.company.form do
        column :company_activity
        column :company_employees_nb

      attributes_table do
        row :company_activity
        row :company_employees_nb
        row :company_participant_nb
        row :trash_indicator
        row :trash_indicator_list
        row :trash_types
        row :trash_sorting
        row :trash_sorting_types
        row :trash_sorting_quality
        row :trash_sorting_knowledge
        row :structure_sensitivity
        row :structure_environment_strategy
        row :structure_environment_strategy_examples
        row :structure_ecologic_approach
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
        row :company_infos
        row :trash_gestion
        row :company_willing
        row :employees_willing
        row :referent_willing_validation
        row :charte_validation
        row :confidentiality
      end
      end
    end
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :company_id
  filter :role
  filter :civility
  filter :telephone
  filter :newsletter_ekg, :as => :check_boxes
  filter :newsletter_dzd, :as => :check_boxes
  filter :deleted, :as => :check_boxes

  form do |f|
    f.inputs do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :company_id
      f.input :role
      f.input :civility
      f.input :telephone
      f.input :newsletter_ekg
      f.input :newsletter_dzd
      f.input :deleted
      f.input :admin
      f.input :password
      f.actions
    end
  end



end
