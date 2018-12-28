class UserBehaviourDiag < ApplicationRecord
  belongs_to :user

  has_many :priority_actions, inverse_of: :user_behaviour_diag
  accepts_nested_attributes_for :priority_actions, reject_if: :all_blank, allow_destroy: true


  has_many :diag_no_app_reasons, dependent: :destroy
  has_many :no_app_reason, through: :diag_no_app_reasons
  accepts_nested_attributes_for :no_app_reason
  accepts_nested_attributes_for :diag_no_app_reasons

  has_many :diag_app_reasons, dependent: :destroy
end
