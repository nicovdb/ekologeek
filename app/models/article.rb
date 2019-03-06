class Article < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  belongs_to :project
  belongs_to :user
  acts_as_taggable_on :tags


  scope :published, -> { where(published: true) }
end
