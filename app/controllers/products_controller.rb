class ProductsController < ApplicationController
  include Pagy::Backend

  def new
    @product = Product.new
    @product.images.build
  end

  def show
    @product = Product.find(params[:id])
    @carts = Cart.new
    @favorite = Favorite.new
    @comment = Comment.new
    review_sum = 0
    @product.comments.each do |comment|
      review = comment.review
      review_sum += comment.review
    end
      number = @product.comments.count
      @review_average =  (review_sum.to_f / number).round(1)
  end

  def edit
    if shop_signed_in?
       @product = Product.find(params[:id])
    end
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to product_search_path
  end

  def update
  end

  def destroy
  end

  def product_search
        if params[:content].nil?
          @shops = Shop.where('shop_introduction LIKE ?', "%#{params[:content]}%") + Shop.where('shop_name LIKE ?', "%#{params[:content]}%")
          @products = Product.where('product_name LIKE ?', "%#{params[:content]}%") + Product.where('product_introduction LIKE ?', "%#{params[:content]}%")
           # shops_id = @shops.map{|shop| shop.id}
           # products_id = @products.map{|product| product.id}
            # @shops = shops_id.map{|i| Shop.find(i)}
          @shops = Kaminari.paginate_array(@shops).page(params[:page])
          @products = Kaminari.paginate_array(@products).page(params[:page])
          @search = "true"
        else

          if user_signed_in?
            @user = User.find(current_user.id)
          else
            @shop = Shop.page(params[:page]).reverse_order
            @product = Product.page(params[:page]).reverse_order
          end
        end

  end


  private
    def product_params
      params.require(:product).permit(:shop_id, :product_name, :product_introduction, :product_genre, :product_price, :product_stock, images_product_images: [])
    end
end
