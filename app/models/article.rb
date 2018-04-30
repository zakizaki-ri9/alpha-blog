class Article < ActiveRecord::Base
  
  belongs_to :user
  
  # presence = nilチェック
  # length = 長さチェック
  validates :title, presence: true, length: {minimus: 3, maximum: 50}
  validates :description, presence: true, length: {minimus: 10, maximum: 300}
  validates :user_id, presence: true
end