class DiagNoApReason < ApplicationRecord
  belongs_to :no_app_reason
  belongs_to :user_behaviour_diag
end
