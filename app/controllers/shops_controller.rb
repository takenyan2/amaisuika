class ShopsController < ApplicationController
  def main

  end

  def index
    #if params[:shops_id].nil? && params[:products_id].nil?
       #@shops = Shop.page(params[:page]).reverse_order
       #@products = Product.page(params[:page]).reverse_order
    #else
       #@shops = params[:shops_id]
       #@products = params[:products_id]
       #shops_id = []
       #produs_id = []
       #@shops.each do |shop|
       # shops_id.push(Shop.find(shop))
       #end
       #@products.each do |product|
       #products_id.push(Product.find(product))
       #end
       #@shops = Kaminari.paginate_array(shops_id).page(params[:page])
       #@products = Kaminari.paginate_array(products_id).page(params[:page])
       #@search == "true"
    #end
  end

  def new
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
  end

  def follow
  end

  def seach
  end

  def prefectures
  end

  def update
  end

  def destroy
  end
end
