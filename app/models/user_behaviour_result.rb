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
  validates :work_sorting_order, :work_sorting_applied, :work_trash_reduction, :home_sorting_order, :home_sorting_applied, :home_trash_reduction, presence: true, if: :page_four?
  validates :context_knowledge, :concerned, :favorable_reduction, :crappy_reduction, :trash_reduction_hard, :dedicated_employee, presence: true, if: :page_five?
end
