class Article < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  belongs_to :project
  belongs_to :user
  acts_as_taggable_on :tags
  mount_uploader :cover, CoverUploader

  enum visibility: {intern: 0, extern: 1, both: 2}


  scope :published, -> { where(published: true) }


end
