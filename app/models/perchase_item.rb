class PerchaseItem < ApplicationRecord
	belongs_to :perchase_history
	belongs_to :product

	validates :purchase_history_id, presence: true
	validates :purchase_product_name, presence: true
	validates :purchase_product_image_id, presence: true
	validates :purchase_product_price, presence: true
	validates :purchase_product_quantity, presence: true
	validates :purchase_product_total_price, presence: true
end
