class Company < ApplicationRecord
  belongs_to :project
  has_one :form
  has_many :users

  validates :name, :town, presence: true
end
