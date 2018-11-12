class Company < ApplicationRecord
  belongs_to :project
  has_many :users
  has_many :referents
  validates :name, :town, presence: true
end
