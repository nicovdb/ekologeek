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

end

