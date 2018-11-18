class Form < ApplicationRecord

  belongs_to :company
  has_many :form_company_know_hows
  has_many :company_know_hows, through: :form_company_know_hows
  has_many :form_trash_providers
  has_many :trash_providers, through: :form_trash_providers
  has_many :form_trash_working_types
  has_many :trash_working_types, through: :form_trash_working_types
  has_many :form_dispositives
  has_many :dispositives, through: :form_dispositives


  validates :company_activity, :company_employees_nb, :company_participant_nb, presence: true, if: :company_infos?
  validates :trash_indicator, :trash_types, :trash_sorting, :trash_sorting_quality, :trash_sorting_knowledge, presence: true, if: :trash_gestion?
  validates :structure_sensitivity, :structure_environment_strategy, :structure_ecologic_approach, :structure_concrete_actions, :structure_direction_interest, :structure_direction_interest_reasons, presence: :true, if: :company_willing?
  validates :employees_knowledge, :employees_propositions, :employees_concerned, :employees_engagement, :employees_actions_home, :employees_actions_work, presence: :true, if: :employees_willing?
  validates :referent_implication, :referent_sorts, :referent_accompany, :referent_complications, :referent_winner, :referent_willing, :referent_obligation, :referent_obligation_feeling, :referent_valorisation, :referent_fun, :referent_techniques, :referent_actions_home, :referent_personal_reasons, :referent_changes_wanted, :referent_accompaniment_need, :referent_sex, :referent_age, :referent_seniority, :referent_service, presence: :true, if: :referent_willing?
  validates :charte, :cgv, :confidentiality, presence: :true, if: :charte?


  def company_infos?
    company_infos
  end

  def trash_gestion?
    trash_gestion
  end

  def company_willing?
    company_willing
  end

  def employees_willing?
    employees_willing
  end

  def referent_willing?
    referent_willing_validation
  end

  def charte?
    charte_validation
  end

end

