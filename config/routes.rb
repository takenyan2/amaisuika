Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
	root 'products#product_search'
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
	resources :products, only: [:new, :show, :edit, :create, :update, :destroy] do
		resource :favorites, only: [:create, :destroy]
	end
	resources :carts, only: [:show, :create, :destroy]
	resources :purchase_histories, only: [:new, :create]
	resources :follows, only: [:create, :destroy]

	get  "/top" => "users#top", as: "top"
	get  "/shops/:id/main" => "shops#main", as: "shop_main"
	get  "/users/:id/search" => "users#search", as: "search"
	get  "/shops/:id/main" => "shops#main", as: "main"
	get  "/shops/:id/folllow" => "shops#folllow", as: "shops_follow"
	post  "/shop/search" => "shops#search", as: "shop_search"
	get  "/shop/prefectures" => "shops#prefectures", as: "shop_search_prefectures"
	get "/product/search" => "products#product_search", as: "product_search"
	get "/carts/show" => "cart#show", as: "cart_buy"
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
