class NotMadeReason < ApplicationRecord
  has_many :result_not_made_reasons, dependent: :destroy
end
