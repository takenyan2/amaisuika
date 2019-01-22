class ApplicationController < ActionController::Base
	#もしショップがログインしたらショップのTOPページにリダイレクトさせる記述をする
	  before_action :configure_permitted_parameters, if: :devise_controller?
	  add_flash_types :success, :info, :warning, :danger

	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:prefecture, :shop_name, :shop_introduction, :send_period, :shop_phone_number])
	  	devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :kana_user_name, :nick_name, :postal_code, :address, :phone_number])
	end


end
