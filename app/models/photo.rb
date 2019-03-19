class Photo < ApplicationRecord
  belongs_to :article
  include ImageUploader[:image]
end
