class Bin < ApplicationRecord
  belongs_to :company
  belongs_to :bin_type
  has_many :collects, dependent: :destroy
  has_many :trash_bins, dependent: :destroy
  has_many :trashes, through: :trash_bins

  validates :volume,:bin_type_id, :frequency_number, :frequency_periodicity, :collector, presence: true
  validates :volume, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
