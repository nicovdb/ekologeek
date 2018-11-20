class Referent < ApplicationRecord
  belongs_to :user
  belongs_to :company

   def name
    "#{self.user.first_name} #{self.user.last_name}"
  end

end
