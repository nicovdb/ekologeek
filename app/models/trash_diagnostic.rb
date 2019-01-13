class TrashDiagnostic < ApplicationRecord
  belongs_to :company

  validates :employees_nb, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :annual_cost, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :reduction_objective, presence: true, numericality: { greater_than_or_equal_to: 10}
end
