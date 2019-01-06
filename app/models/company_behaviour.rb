class CompanyBehaviour < ApplicationRecord
  belongs_to :company
  has_many :diag_actions, dependent: :destroy
  accepts_nested_attributes_for :diag_actions, reject_if: :all_blank, allow_destroy: true

  has_many :result_actions, dependent: :destroy
end
