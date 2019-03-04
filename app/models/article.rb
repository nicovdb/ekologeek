class Article < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
  has_many :comments, dependent: :destroy
  belongs_to :project
  belongs_to :user

  scope :published, -> { where(published: true) }
end
