class CompanyBehaviour < ApplicationRecord
  belongs_to :company
  has_many :diag_actions, dependent: :destroy
  has_many :result_actions, dependent: :destroy
end
