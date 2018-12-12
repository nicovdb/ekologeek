class DiagAppReason < ApplicationRecord
  belongs_to :app_reason
  belongs_to :user_behaviour_diag
end
