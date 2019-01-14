class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
     attachment :user_image
  	 devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable

      enum user_status: { 一般ユーザー:0, 管理者:1 }

     has_many :follows, dependent: :destroy
     has_many :carts, dependent: :destroy
     has_many :favorites, dependent: :destroy
     has_many :comments, dependent: :destroy

     has_many :shops, through: :follows
  	 has_many :products, through: :favorites
  	 has_many :products, through: :carts
  	 has_many :products, through: :comments

     validates :user_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角ひらがな、全角カタカナ、漢字で入力してください" }
     validates :kana_user_name, format: { with: /\A[ァ-ンー－]+\z/, message: "全角カタカナで入力してください" }
     validates :nick_name, presence: true
     validates :postal_code, format: { with: /\A\d{7}\z/, message: "ハイフンなしの数字7桁で入力してください" }
     validates :address , presence: true
     validates :phone_number, format: { with: /\A\d{10}\zA|\A\d{11}\z/, message: "ハイフンなしの11桁で入力してください" }
end
