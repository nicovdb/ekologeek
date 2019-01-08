class AppReason < ApplicationRecord
  has_many :diag_app_reasons, dependent: :destroy

  attr_reader :autre

  scope :public_only, -> { where(public: true) }

  def name
    reason
  end
end
