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
      if user_signed_in?
      @user = current_user
      end
  end

  def edit
    if shop_signed_in? || current_user.user_status == "管理者"
       @shop = Shop.find(params[:id])
    else
      redirect_to main_path
    end
  end

  def follow
    if shop_signed_in?
       @shop = Shop.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def seach
  end

  def update
    if shop_signed_in?
       @shop = Shop.find(params[:id])
        if @shop.id == current_shop.id
            @shop.update(shop_params)
            redirect_to main_path(@shop.id)
            flash[:success] = "ユーザー情報を更新しました。"
        else
            render :edit
            flash[:danger] = "ユーザー情報の更新に失敗しました。記入内容を確認してください。"
        end
    elsif current_user.user_status == "管理者"
          @shop = Shop.find(params[:id])
          @shop.update(shop_params)
          redirect_to search_path(current_user.id)
          flash[:success] = "ユーザー情報を更新しました。"
    else
      redirect_to main_path
    end
  end

  def destroy
    shop = Shop.find(params[:id])
        shop.shop_deleted_at = DateTime.now
        shop.save
        redirect_to destroy_shop_session_path
  end

  private
  def shop_params
      params.require(:shop).permit(:prefecture, :shop_name, :shop_introduction, :send_period, :shop_phone_number, :shop_deleted_at, :shop_image)
  end

end
