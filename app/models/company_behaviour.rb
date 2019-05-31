class CompanyBehaviour < ApplicationRecord
  belongs_to :company
  has_many :diag_actions, dependent: :destroy
  accepts_nested_attributes_for :diag_actions, reject_if: :all_blank, allow_destroy: true

  has_many :result_actions, dependent: :destroy
  accepts_nested_attributes_for :result_actions, reject_if: :all_blank, allow_destroy: true

  validates :participants_nb, presence: true, if: :step_one?
  validates :actions_displayed,
            :strategic_display,
            :newbies_sensitized,
            :indicators_communicated,
            presence: true, if: :step_two?
  validates :employees_sensitized, presence: true, if: :result_step_two?
  validates :actions_nb_result, :daily_actions_diag, presence: true, if: :result_step_three?

  def result_step_two?
    if self.step_two? && self.result
      true
    else
      false
    end
  end

  def result_step_three?
    if self.step_three? && self.result
      true
    else
      false
    end
  end

  def self.diag
    CompanyBehaviour.where("created_at <= :diag_end_at", {diag_end_at: "2019/02/14"})
  end

  def self.bilan
    CompanyBehaviour.where("created_at >= :bilan_start_at", {bilan_start_at: "2019/05/15"})
  end
end

