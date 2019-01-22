class CartsController < ApplicationController
	before_action :authenticate_user!
  def show
    if current_user
    	@carts = Cart.where(user_id: current_user.id)
      @purchase = PurchaseHistory.new
      @total_price = 0

      @carts.each do |c|
        @total_price += c.product.product_price * c.product_quantity
  	  end
    else
      redirect_to root_path
    end
  end

  def create
  	cart = Cart.new(cart_params)
    cart.user_id = current_user.id
    if Cart.find_by(product_id: cart.product_id,user_id: current_user.id)
      redirect_to product_path(current_user.id)
      flash[:danger] = "ERROR!すでに商品がカートに入っています。"
    else
      cart.save
      redirect_to cart_buy_path
      flash[:success] = "カートに商品を追加しました。"
    end
  end

  def destroy
  	cart_item = Cart.find(params[:id])
    cart_item.destroy
    redirect_to cart_path(current_user.id)
    flash[:success] = "カートの商品を削除しました。"
  end

  private
	def cart_params
		params.require(:cart).permit(:product_quantity, :product_id, :user_id)
	end
end
