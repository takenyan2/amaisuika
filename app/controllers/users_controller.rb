class UsersController < ApplicationController
  def top
  end

  def index
  end

  def show
    @user = User.find(params[:id])
    if @user.id != current_user.id
       redirect_to root_path
       flash[:danger] = "ERROR!このページにアクセスする権限がありません。"
    else
      @carts = PurchaseHistory.where(user_id: current_user.id)
      @a = []
      sum = 0
      day = ""
      purchase_histories = @user.purchase_histories.order(purchase_at: :desc)
        purchase_histories.each do |purchase_history|
          subtotal = 0
          day = purchase_history.purchase_at
            purchase_history.purchase_items.each do |item|
              subtotal += item.purchase_product_price
              @item_name = item.purchase_product_name
              @item_quantity = item.purchase_product_quantity
              @item_price = item.purchase_product_price
              @item_total_price = item.purchase_product_total_price
              @item_status = purchase_history.send_status
            end
          if @a != [] && @a.last[1] == day
              @a.last[0] += subtotal
          else
              @a.push([subtotal,day])
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
