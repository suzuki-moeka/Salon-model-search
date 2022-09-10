Rails.application.routes.draw do
  namespace :customer do
     resources :posts, only: [:new, :index, :show, :edit, :create, :destroy, :update]
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
    post 'customer/guest_sign_in', to: 'customer/sessions#guest_sign_in'
  end

  root to: 'customer/homes#top'
  get "customer/homes/about" => "homes#about"
  #post 'customer/guests/guest_sign_in', to: 'guests#new_guest'
  
  get "searches" => "customer/searches#search"
  
  resources :tags, only: %w[index show destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
