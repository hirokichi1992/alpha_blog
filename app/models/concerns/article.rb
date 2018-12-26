class Article < ApplicationRecord
  has_many :article_categories
  has_many :categories, through: :article_categories
  belongs_to :user
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 3000 }
  default_scope -> { order(created_at: :desc) }
end
