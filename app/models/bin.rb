class Bin < ApplicationRecord
  belongs_to :company
  has_many :collects, dependent: :destroy
  has_many :trash_bins, dependent: :destroy
  has_many :trash_frequencies, dependent: :destroy
end
