Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :cloths do
    resources :bookings, only: [:new, :create, :edit, :update]
    resources :bookmarks, only: [:create]
  end
  resources :bookmarks, only: [:index, :destroy]

  resources :bookings, only: [:index, :destroy] do
    resources :reviews, only: [:new, :create, :edit, :update]
  end

  resources :reviews, only: [:destroy]

  patch "cloths/:cloth_id/bookings/:id/approve", to: "bookings#approve", as: :approve_cloth_booking
end
