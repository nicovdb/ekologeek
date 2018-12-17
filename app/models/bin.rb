class Bin < ApplicationRecord
  belongs_to :company
  belongs_to :bin_type
  has_many :collects, dependent: :destroy
  has_many :trash_bins, dependent: :destroy
  has_many :trashes, through: :trash_bins
end
