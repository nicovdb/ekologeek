class Bin < ApplicationRecord
  belongs_to :company
  belongs_to :bin_type
  has_many :collects, dependent: :destroy
  has_many :trash_bins, dependent: :destroy
  has_many :trashes, through: :trash_bins

  validates :volume,:bin_type_id, :cost, :frequency_number, :frequency_periodicity, :collector, presence: true
end
