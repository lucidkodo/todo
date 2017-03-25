Rails.application.routes.draw do
	resources :users, except: [:new]
	resources :sessions, only: [:new, :create, :destroy]

	resources :users do
		resources :tasks, except: [:new]
	end

  delete "sign_out" => "sessions#destroy", :as => "sign_out"
	get "sign_in" => "sessions#new", :as => "sign_in"
	get "sign_up" => "users#new", :as => "sign_up"
	root :to => "tasks#index"
end
