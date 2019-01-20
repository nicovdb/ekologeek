class TrashBin < ApplicationRecord
  belongs_to :trash
  belongs_to :bin
  
end
