class PurchaseHistory < ApplicationRecord
	belongs_to :user
	has_many :purchase_items

	# validates :user_id, presence: true
	validates :send_address, presence: true
	validates :send_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角ひらがな、全角カタカナ、漢字で入力してください" }
	validates :send_postal_code, format: { with: /\A\d{7}\z/, message: "ハイフンなしの数字7桁で入力してください" }
	validates :send_status, presence: true
	validates :purchase_at, presence: true
end
