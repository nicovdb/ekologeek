class NoAppReason < ApplicationRecord

  has_many :diag_no_ap_reasons, dependent: :destroy

  attr_reader :other

  scope :public_only, -> { where(public: true) }

  def name
    reason
  end
end
