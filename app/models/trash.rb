class Trash < ApplicationRecord
  has_many :trash_bins, dependent: :destroy
  has_many :bins, through: :trash_bins, dependent: :destroy 
  has_many :trash_result_actions, dependent: :destroy
end
