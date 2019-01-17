class FollowsController < ApplicationController

	def create
		shop = Shop.find(params[:shop_id])
    	follow = current_user.follows.new(shop_id: shop.id)
    	follow.save
    	redirect_to shop_path(shop)
	end

	def destroy
		shop = Shop.find(params[:shop_id])
    	follow = current_user.follows.find_by(shop_id: shop.id)
    	follow.destroy
    	redirect_to shop_path(shop)
	end
end
