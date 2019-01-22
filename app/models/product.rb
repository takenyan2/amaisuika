class Product < ApplicationRecord
    has_many :images, dependent: :destroy
    accepts_attachments_for :images, attachment: :product_image
    has_many :carts, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :purchase_items, dependent: :destroy
    belongs_to :shop

    has_many :users, through: :favorites
    has_many :users, through: :carts
    has_many :users, through: :comments
    has_many :perchase_history, through: :purchase_items

    # validates :shop_id, presence: true
    validates :product_name, length: { minimum:2, maximum:20 }
    validates :product_introduction, presence: true
    validates :product_genre, presence: true
    validates :product_price, presence: true
    validates :product_stock, presence: true

    def favorited_by?(id)
        favorites.where(user_id: id).exists?
    end
end
