Rails.application.routes.draw do
	root 'shops#index'
devise_for :shops, controllers: {
  sessions:      'shops/sessions',
  passwords:     'shops/passwords',
  registrations: 'shops/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

	resources :users, only: [:index, :show, :edit, :update, :destroy]
	resources :shops, only: [:index, :new, :show, :edit, :update, :destroy]
	resources :products, only: [:new, :show, :edit, :create, :update, :destroy]
	resources :carts, only: [:show, :create, :destroy]
	resources :purchase_historys, only: [:new, :create]

	get  "/top" => "users#top", as: "top"
	get  "/shops/:id/main" => "shops#main", as: "shop_main"
	get  "/users/:id/seach" => "users#seach", as: "search"
	get  "/shops/:id/main" => "shops#main", as: "main"
	get  "/shops/:id/folllow" => "shops#folllow", as: "follow"
	post  "/shop/seach" => "shop#seach", as: "shop_search"
	get  "/shop/prefectures" => "shop#prefectures", as: "shop_search_prefectures"

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
