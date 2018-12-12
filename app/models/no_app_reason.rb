class NoAppReason < ApplicationRecord
  has_many :diag_no_app_reasons, dependent: :destroy
end
