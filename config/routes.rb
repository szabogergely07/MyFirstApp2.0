Rails.application.routes.draw do
  
  devise_for :users
  
  resources :users

  resources :products do
    resources :comments
  end

  resources :payments

  post 'payments/create'

  get 'static_pages/bikes'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  get 'static_pages/landing_page'

  post 'static_pages/thank_you'

  resources :orders, only: [:index, :show, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'static_pages#index'

end
