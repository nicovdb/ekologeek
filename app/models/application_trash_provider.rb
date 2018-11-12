class ApplicationTrashProvider < ApplicationRecord
  belongs_to :application
  belongs_to :trash_provider
end
