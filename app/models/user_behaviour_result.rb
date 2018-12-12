class UserBehaviourResult < ApplicationRecord
  belongs_to :user
  has_many :result_not_made_reasons, dependent: :destroy
end
