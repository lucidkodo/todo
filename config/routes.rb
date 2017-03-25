Rails.application.routes.draw do
	resources :users
	resources :sessions

  delete "sign_out" => "sessions#destroy", :as => "sign_out"
	get "sign_in" => "sessions#new", :as => "sign_in"
	get "sign_up" => "users#new", :as => "sign_up"
	root :to => "users#new"
end
