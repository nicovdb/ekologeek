class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user, optional: true


  def mine?(user)
    self.user_id == user.id
  end
end
