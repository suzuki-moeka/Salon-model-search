Rails.application.routes.draw do

  namespace :customer do
     resources :posts, only: [:new, :index, :show, :edit, :create, :destroy, :update] do
     resources :post_comments, only: [:create, :destroy]
     resource :likes, only: [:create, :destroy]
    end
  end

  namespace :customer do
    resources :customers, only: [:edit, :show, :update]
  end

  namespace :admin do
    get "homes/top" => "homes#top"
    resources :customers, only: [:index, :show, :edit, :update]
  end

  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions:      'admin/sessions',
  }

  devise_for :customer, skip: [:passwords], controllers: {
    sessions:      'customer/sessions',
    passwords:     'customer/passwords',
    registrations: 'customer/registrations'
  }

  root to: 'customer/homes#top'
  get "customer/homes/about" => "homes#about"
  get "searches" => "customer/searches#search"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
