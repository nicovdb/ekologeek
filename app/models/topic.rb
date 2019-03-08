class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :answers
  validates :content, presence: true
end
