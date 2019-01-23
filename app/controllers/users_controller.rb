class UsersController < ApplicationController
  def top
      if  user_signed_in?
        if current_user.user_status == "一般ユーザー"
          redirect_to product_search_path(current_user.id)
        elsif current_user.user_status == "管理者"
          redirect_to search_path(current_user.id)
        end
      end
      if shop_signed_in?
          redirect_to main_path(current_shop.id)
      end
  end

  def index
    @user = current_user
      if @user.user_status == "管理者"
          @products = Product.all
          if params[:permission]
            if params[:permission] == "true"
                product = Product.find(params[:product_id])
                product.permission = false
                product.save
                redirect_to users_path(current_user.id)
            elsif params[:permission] == "false"
                  product = Product.find(params[:product_id])
                  product.destroy
                  redirect_to users_path
            else  params[:permission] != true && params[:permission] != false
                  redirect_to search_path(current_user.id)
                  flash[:danger] = "ERROR!保存に失敗しました。"
            end
          end
      else
         redirect_to root_path
      end
  end

  def show
    @user = User.find(params[:id])
    if @user.id == current_user.id || current_user.user_status == "管理者"
        @day_histories = [] #day_histories初期化
        @user.purchase_histories.each do |purchase_history|
          day = purchase_history.purchase_at
          day_history = {}
          @day_histories.each do |history|
            if day == history["day"]
              day_history = history
              break
            end
          end

          if day_history.empty?
            day_history["subtotal"] = 0
            day_history["items"] = []
            day_history["day"] = day
            @day_histories.push(day_history)
          end

          purchase_history.purchase_items.each do |item|
            day_history["subtotal"] += item.purchase_product_price * item.purchase_product_quantity
              item_name = item.purchase_product_name
              item_price = item.purchase_product_price
              item_quantity = item.purchase_product_quantity
              item_status = purchase_history.send_status
              item_total_price = item.purchase_product_total_price
              item_image = item.purchase_product_image_id
            day_history["items"].unshift(item_name, item_price, item_quantity, item_status, item_total_price,item_image)
          end
        end
    else
      redirect_to root_path
      flash[:danger] = "ERROR!このページにアクセスする権限がありません。"
    end
  end

  def edit
      if current_user
        @user = User.find(params[:id])
      elsif current_user.user_status == "管理者"
        @user = User.find(params[:id])
      else
        redirect_to product_search_path
      end
  end

  def search
      @user = current_user
      if @user.user_status == "管理者"
         @user_search = User.page(params[:page]).reverse_order
         @shops_search = Shop.page(params[:page]).reverse_order
        if params[:content]
          @user_search = User.where('user_name LIKE ?', "%#{params[:content]}%") + User.where('kana_user_name LIKE ?', "%#{params[:content]}%") + User.where('nick_name LIKE ?', "%#{params[:content]}%")
          @shops_search = Shop.where('shop_name LIKE ?', "%#{params[:content]}%") + Shop.where('shop_introduction LIKE ?', "%#{params[:content]}%")
          @user_search = Kaminari.paginate_array(@user_search).page(params[:page])
          @shops_search = Kaminari.paginate_array(@shops_search).page(params[:page])
          @search = "true"
        else
          @user_search = User.page(params[:page]).reverse_order
          @shops_search = Shop.page(params[:page]).reverse_order
         end
      else
         redirect_to root_path
      end
  end

  def update
      @user = User.find(params[:id])
      if @user.user_status == "一般ユーザー"
        if @user.update(user_params)
            redirect_to user_path(@user)
            flash[:success] = "ユーザー情報を更新しました。"
        else
            render :edit
            flash[:danger] = "ユーザー情報の更新に失敗しました。記入内容を確認してください。"
        end
      else @user.user_status == "管理者"
        if @user.update(user_params)
            redirect_to search_path(current_user.id)
            flash[:success] = "ユーザー情報を更新しました。"
        else
            render :edit
            flash[:danger] = "ユーザー情報の更新に失敗しました。記入内容を確認してください。"
        end
      end
  end

  def destroy
      user = User.find(params[:id])
        user.user_deleted_at = DateTime.now
        user.save
        redirect_to  destroy_user_session_path
  end

  private
    def product_params
        params.require(:product).permit(:shop_id, :product_name, :product_introduction, :product_genre, :product_price, :product_stock, images_product_images: [])
    end

  private
    def user_params
        params.require(:user).permit(:user_name, :kana_user_name, :nick_name, :postal_code, :address, :phone_number,:user_image)
    end

end
