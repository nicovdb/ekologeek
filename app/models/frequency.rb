class Frequency < ApplicationRecord
  has_many :trash_frequencies, dependent: :destroy
end
