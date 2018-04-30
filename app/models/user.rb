class User < ActiveRecord::Base
  
  # usernameのバリデーションチェック定義
  validates :username,
      presence: true,
      uniqueness: { case_sensitive: false},
      length: {minimum: 3, maximum: 25}
  
  # email用の正規表現定義
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  # emailのバリデーションチェック定義
  validates :email,
      presence: true,
      length: {maximum: 105},
      uniqueness: { case_sensitive: false},
      format: { with: VALID_EMAIL_REGEX }
end