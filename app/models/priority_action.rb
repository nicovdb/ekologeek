class PriorityAction < ApplicationRecord
  belongs_to :user_behaviour_diag
  #
  validates :priority_level, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :action, presence: true
end
