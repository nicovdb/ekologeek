class UserBehaviourDiag < ApplicationRecord

  attr_accessor :other_label
  attr_accessor :autre_label
  
  belongs_to :user
  has_one :company, through: :user

  has_many :priority_actions, inverse_of: :user_behaviour_diag, dependent: :destroy
  accepts_nested_attributes_for :priority_actions, reject_if: :all_blank, allow_destroy: true

  has_many :diag_no_ap_reasons, dependent: :destroy
  has_many :no_app_reasons, through: :diag_no_ap_reasons

  has_many :diag_app_reasons, dependent: :destroy
  has_many :app_reasons, through: :diag_app_reasons


  validates :work_sorting_order, :work_sorting_applied, :work_trash_reduction, presence: true, if: :page_one?
  validates :context_knowledge, :concerned, :trash_reduction_hard, presence: true, if: :page_two?
  validates :no_app_reason_ids, :app_reason_ids, presence: true, if: :page_four?
end
