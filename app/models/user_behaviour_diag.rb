class UserBehaviourDiag < ApplicationRecord
  belongs_to :user
  has_many :priority_actions, dependent: :destroy
  has_many :diag_no_app_reasons, dependent: :destroy
  has_many :diag_app_reasons, dependent: :destroy
end
