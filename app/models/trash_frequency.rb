class TrashFrequency < ApplicationRecord
  belongs_to :frequency
  belongs_to :bin
end
