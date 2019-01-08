class UserBehaviourDiag < ApplicationRecord

  attr_accessor :other_label
  attr_accessor :autre_label
  belongs_to :user

  has_many :priority_actions, inverse_of: :user_behaviour_diag
  accepts_nested_attributes_for :priority_actions, reject_if: :all_blank, allow_destroy: true

  has_many :diag_no_ap_reasons, dependent: :destroy
  has_many :no_app_reasons, through: :diag_no_ap_reasons

  has_many :diag_app_reasons, dependent: :destroy
  has_many :app_reasons, through: :diag_app_reasons

  validates :work_sorting_order, :work_sorting_applied, :work_trash_reduction, :work_trash_reduction_comment, :home_sorting_order, :home_sorting_applied, :home_trash_reduction, :home_trash_reduction_comment, presence: true, if: :page_one?
  validates :context_knowledge, :context_knowledge_comment, :concerned, :favorable_reduction, :crappy_reduction, :trash_reduction_hard, :dedicated_employee, presence: true, if: :page_two?
  validates :priority_actions, presence: true, if: :page_three?
  validates :no_app_reason_ids, :app_reason_ids, presence: true, if: :page_four?
  validates :no_app_reason_ids, :app_reason_ids, presence: true, if: :page_four?
  validates :sexe, :age, :seniority, presence: true, if: :page_five?
end
