class Company < ApplicationRecord
  belongs_to :project
  validates :name, :town, presence: true
end
