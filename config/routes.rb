Rails.application.routes.draw do
  root to: 'customer/homes#top'

  namespace :customer do
    resources :reserves, only: [:index, :new, :show, :create, :destroy]
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resource :likes, only: [:create, :destroy]
      collection do
        get :search_post
      end
    end
    resources :customers, only: [:edit, :show, :update]
  end

  namespace :admin do
    get "homes/top" => "homes#top"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :reserves, only: [:index]
  end

  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions:      'admin/sessions',
  }

  devise_for :customer, skip: [:passwords], controllers: {
    sessions:      'customer/sessions',
    passwords:     'customer/passwords',
    registrations: 'customer/registrations'
  }

  devise_scope :customer do
    post 'customer/guest_sign_in', to: 'customer/sessions#new_guest'
  end

  get "customer/homes/about" => "customer/homes#about"
  get "searches" => "customer/searches#search"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
