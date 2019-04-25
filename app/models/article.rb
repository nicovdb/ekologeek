class Article < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  belongs_to :project
  belongs_to :user
  acts_as_taggable_on :tags
  mount_uploader :cover, CoverUploader

  validates :author, :title, :subtitle, :content, :visibility, presence: true

  enum visibility: { intern: 0, extern: 1, both: 2 }

  scope :published, -> { where(published: true) }

  scope :visibles, -> { published.where(visibility: :both) }

  def to_param
    "#{id} #{title}".parameterize
  end

  def next
    Article.visibles.where("created_at > ?", created_at).order(created_at: :asc).take
  end

  def prev
    Article.visibles.where("created_at < ?", created_at).order(created_at: :desc).take
  end


end
