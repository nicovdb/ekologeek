class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user, optional: true
  validates :content, :author, presence: true

  def mine?(user)
    self.user_id == user.id
  end
end
