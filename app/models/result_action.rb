class ResultAction < ApplicationRecord
  belongs_to :company_behaviour
  has_many :trash_result_actions, dependent: :destroy
end
