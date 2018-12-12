class AppReason < ApplicationRecord
  has_many :diag_app_reasons, dependent: :destroy
end
