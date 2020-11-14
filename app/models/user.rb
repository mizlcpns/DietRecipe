class User < ApplicationRecord
  mount_uploader :image, ImageUploader #gem'carrierwave'でimageの表示が可能
  
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, #正規表現
                    uniqueness: { case_sensitive: false } #重複を許さず、大文字と小文字を区別しない
  has_secure_password
end
