class PurchaseItem < ApplicationRecord
	belongs_to :purchase_history, optional: true
	belongs_to :product

	validates :purchase_history_id, presence: true
	validates :purchase_product_name, presence: true
	validates :purchase_product_image_id
	validates :purchase_product_price, presence: true
	validates :purchase_product_quantity, presence: true
	validates :purchase_product_total_price, presence: true
end
