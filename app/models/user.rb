class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,         presence: true
  validates :password,         format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'を正確に入力してください' }
  validates :last_name_kanji,  presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々一]+\z/, message: 'を正確に入力してください' }
  validates :first_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々一]+\z/, message: 'を正確に入力してください' }
  validates :last_name_kana,   presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: 'を正確に入力してください' }
  validates :first_name_kana,  presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: 'を正確に入力してください' }
  validates :birthday,         presence: true

  has_many :items
  has_many :buys
end
