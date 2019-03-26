class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :answers, dependent: :destroy
  mount_uploader :cover, CoverUploader
  validates :content, :cover, presence: true

  def mine?(user)
    self.user_id == user.id
  end
end
