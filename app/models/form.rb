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


  validates :company_activity, presence: true, if: :company_infos?
  validates :trash_sorting, presence: true, if: :trash_gestion?
  validates :structure_sensitivity, presence: :true, if: :company_willing?
  validates :employees_knowledge, presence: :true, if: :employees_willing?
  validates :employees_propositions_examples, presence: :true, if: :employees_willing?
  validates :referent_sorts, presence: :true, if: :referent_willing?
  validates :charte, presence: :true, if: :charte?


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

