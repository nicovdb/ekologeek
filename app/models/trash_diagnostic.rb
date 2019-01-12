class TrashDiagnostic < ApplicationRecord
  belongs_to :company

  validates :annual_cost, :employees_nb, presence: true
  validates :reduction_objective, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 10}
end
