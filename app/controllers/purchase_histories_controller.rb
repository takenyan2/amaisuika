class PurchaseHistoriesController < ApplicationController
  def new
  	@carts = Cart.where(user_id: current_user.id)
  end

  def create
  	@user = User.find(current_user.id)
  	@purchase = PurchaseHistory.new(purchase_params)
  	@purchase.purchase_at = Date.today
	@purchase.user_id = current_user.id
	@carts = Cart.where(user_id: current_user.id)
	    if 	@purchase.save
			@carts.each do |cart|
				@purchase_i = PurchaseItem.new
				@purchase_i.purchase_history_id = @purchase.id
				@purchase_i.purchase_product_name = cart.product.product_name
				@purchase_i.purchase_product_price = cart.product.product_price
				@purchase_i.purchase_product_quantity = cart.product_quantity
				@purchase_i.product_id = cart.product.id
				@purchase_i.purchase_product_total_price = 0
				@purchase_i.purchase_product_total_price += @purchase_i.purchase_product_price * @purchase_i.purchase_product_quantity
				a = cart.product
				a.images.each do |image|
					@purchase_i.purchase_product_image_id = image.product_image_id
				end

				@purchase_i.save
				products = Product.where(id: cart.product_id)

				products.each do |p|
		        	#@pur = PurchaseItem.find_by(product_id: product.id)
		        	p.product_stock -= @purchase_i.purchase_product_quantity
		        	p.update(product_stock: p.product_stock)
	        	end

			end
			@carts.destroy_all
		    redirect_to new_purchase_history_path
		else
		redirect_to cart_path(@user.id)
		flash[:danger] = "ERROR!購入に失敗しました。登録情報をご確認ください。"
		end

  end

  private
	def purchase_params
		params.require(:purchase_history).permit(:send_status,:send_name,:send_postal_code,:send_address,:purchase_at, product_attributes: [:id,:purchase__id,:purchase_product_image_id,:purchase_product_price,:purchase_product_quantity,:purchase_product_total_price,:product_id,:_destroy])
	end
end
