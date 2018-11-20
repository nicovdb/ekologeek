class Company < ApplicationRecord
  belongs_to :project

  has_many :users
  has_one :referent

  has_one :form

  validates :name, :town, :usage_acceptance, presence: true
end
