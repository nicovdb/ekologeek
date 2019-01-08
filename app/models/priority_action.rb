class PriorityAction < ApplicationRecord
  belongs_to :user_behaviour_diag
  # 
  # validates :priority_level, presence: true
end
