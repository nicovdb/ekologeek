class DiagNoAppReason < ApplicationRecord
  belongs_to :no_app_reason
  belongs_to :user_behaviour_diag

  accepts_nested_attributes_for :no_app_reason, :reject_if => :all_blank
end
