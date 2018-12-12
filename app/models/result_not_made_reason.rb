class ResultNotMadeReason < ApplicationRecord
  belongs_to :user_behaviour_result
  belongs_to :not_made_reason
end
