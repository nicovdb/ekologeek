class DiagAction < ApplicationRecord
  belongs_to :company_behaviour

  validates :action, presence: true
  validates :diag_action_comment, presence: true
end
