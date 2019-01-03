class NotMadeReason < ApplicationRecord
  has_many :result_not_made_reasons, dependent: :destroy

  attr_reader :other

  scope :public_only, -> { where(public: true) }

  def name
    reason
  end
end
