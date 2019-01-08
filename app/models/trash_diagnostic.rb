class TrashDiagnostic < ApplicationRecord
  belongs_to :company

  validates :annual_cost, :reduction_objective, :employees_nb, presence: true
end
