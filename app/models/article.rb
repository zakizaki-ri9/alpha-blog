class Article < ActiveRecord::Base
  
  belongs_to :user
  
  # 記事とカテゴリの紐付け管理
  has_many :article_categories
  has_many :categories, through: :article_categories
  
  # presence = nilチェック
  # length = 長さチェック
  validates :title, presence: true, length: {minimus: 3, maximum: 50}
  validates :description, presence: true, length: {minimus: 10, maximum: 300}
  validates :user_id, presence: true
end