class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def show
  end

  def edit
  end

  def create
    product = Product.new(puroduct_params)
    product.save
    redirect_to shops_path
  end

  def update
  end

  def destroy
  end


  private
    def product_params
      params.require(:product).permit(:product_name, :product_introduction, :product_genre, :product_price, :product_stock, images_product_image: [])
    end
end
