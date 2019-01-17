class UsersController < ApplicationController
  def top
  end

  def index
    @product = Product.find(params[:id])
       if @product.update(product_params)
          redirect_to product_path(@product.id)
          flash[:success] = "商品の申請を受付けました。"
       else
           redirect_to shop_path(current_shop.id)
           flash[:danger] = "ERROR!商品の編集に失敗しました。記入内容を確認してください。"
       end
  end

  def show
    @user = User.find(params[:id])
    if @user.id != current_user.id
       redirect_to root_path
       flash[:danger] = "ERROR!このページにアクセスする権限がありません。"
    else
      @a = []
      b = []
      sum = 0
      day = ""
      purchase_histories = @user.purchase_histories.order(purchase_at: :desc)
        purchase_histories.each do |purchase_history|
          subtotal = 0
          day = purchase_history.purchase_at
            purchase_history.purchase_items.each do |item|
              subtotal += item.purchase_product_price
            end
          if @a != [] && @a.last[1] == day
              @a.last[0] += subtotal
              #item_name = item.purchase_product_name
              #item_price = item.purchase_product_price
              #item_quantity = item.purchase_product_quantity
              #item_status = purchase_history.send_status
              #item_total_price = item.purchase_product_total_price
          else
              @a.push([subtotal, day])
              #@a.push([subtotal, day, item_name, item_price, item_quantity, item_status, item_total_price])
          end
      end
    end

  end

  def edit
  end

  def seach
  end

  def update
  end

  def destroy
  end
end
