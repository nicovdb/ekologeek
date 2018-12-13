class Company < ApplicationRecord
  belongs_to :project

  has_many :users, dependent: :destroy
  has_many :bins, dependent: :destroy
  has_many :objectives, dependent: :destroy
  has_many :costs, dependent: :destroy

  has_one :referent, dependent: :destroy
  has_one :form, dependent: :destroy
  has_one :trash_diagnostic, dependent: :destroy

  validates :name, :town, :usage_acceptance, presence: true
end
