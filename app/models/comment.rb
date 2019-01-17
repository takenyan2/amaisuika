class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :product

	validates :user_id, presence: true
  	validates :product_id, presence: true
  	validates :review, presence: true
  	validates :comment, presence: true
end
