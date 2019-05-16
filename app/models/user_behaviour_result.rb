class UserBehaviourResult < ApplicationRecord

  attr_accessor :other_label


  belongs_to :user
  has_many :result_not_made_reasons, dependent: :destroy
  has_many :not_made_reasons, through: :result_not_made_reasons

  has_many :action_mades, inverse_of: :user_behaviour_result, dependent: :destroy
  accepts_nested_attributes_for :action_mades, reject_if: :all_blank, allow_destroy: true

  has_many :no_action_mades, inverse_of: :user_behaviour_result, dependent: :destroy
  accepts_nested_attributes_for :no_action_mades, reject_if: :all_blank, allow_destroy: true

  validates :starting_month, presence: true, if: :page_one?
end
