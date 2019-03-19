class Project < ApplicationRecord
  has_many :Companies
  has_many :articles
  has_many :topics
end
