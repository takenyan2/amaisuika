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
    if shop_signed_in? || current_user.user_status == "管理者"
      if current_shop
        @product = Product.find(params[:id])
      elsif current_user.user_status == "管理者"
        @product = Product.find(params[:id])
      else
        redirect_to user_path(current_user.id)
      end
    else
      redirect_to root_path
    end
  end

  def create
    product = Product.new(product_params)
    product.permission = true
    product.save
    redirect_to shop_main_path(current_shop.id)
  end

  def update
      if shop_signed_in?
          if current_shop
             @product = Product.find(params[:id])
             @product.permission = true
             @product.update(product_params)
             redirect_to shop_main_path(current_shop.id)
             flash[:success] = "商品情報を申請しました。"
          else
             redirect_to shop_main_path(current_shop.id)
          end
      elsif current_user.user_status == "管理者"
            @product = Product.find(params[:id])
            @product.permission = true
            @product.update(product_params)
            redirect_to search_path(current_user.id)
            flash[:success] = "商品情報を申請しました。"
      else
        redirect_to root_path
      end
  end

  def destroy
      if shop_signed_in?
         @shop = Shop.find(params[:id])
          if @shop.id == current_shop.id
            product = Product.find(params[:id])
            product.destroy
            redirect_to shop_main_path(current_shop.id)
            flash[:success] = "商品を削除しました。"
          else
             redirect_to shop_main_path(current_shop.id)
          end
      elsif current_user.user_status == "管理者"
            product = Product.find(params[:id])
            product.destroy
            redirect_to search_path(current_user.id)
            flash[:success] = "商品を削除しました。"
      else
        redirect_to root_path
      end
  end

  def product_search
        if params[:content]
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
            @shops = Shop.page(params[:page]).reverse_order
            @products = Product.page(params[:page]).reverse_order
          else
            @shops = Shop.page(params[:page]).reverse_order
            @products = Product.page(params[:page]).reverse_order
          end
        end

  end


  private
    def product_params
      params.require(:product).permit(:shop_id, :product_name, :product_introduction, :product_genre, :product_price, :product_stock, images_product_images: [])
    end
end
