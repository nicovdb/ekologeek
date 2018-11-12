class Application < ApplicationRecord
  belongs_to :company
  has_many :application_company_know_hows
  has_many :company_know_hows, through: :application_company_know_hows
  has_many :application_trash_providers
  has_many :trash_providers, through: :application_trash_providers
  has_many :application_trash_working_types
  has_many :trash_working_types, through: :application_trash_working_types
  has_many :application_dispositives
  has_many :dispositives, through: :application_dispositives
end
