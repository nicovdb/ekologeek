class FormTrashProvider < ApplicationRecord
  belongs_to :form
  belongs_to :trash_provider
end
