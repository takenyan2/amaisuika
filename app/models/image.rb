class Image < ApplicationRecord
	attachment :product_image
	belongs_to :product

	# validates :product_id, presence: true
	# validates :product_image_id, presence: true
end
