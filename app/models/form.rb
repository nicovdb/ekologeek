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
end
