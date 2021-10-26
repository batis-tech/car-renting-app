Rails.application.routes.draw do
  resources :cars
  get 'business/index', as: :business

  devise_for :users
  get 'search' => 'home#search', as: :search
  post'book'=>'home#book',as: :book
   get 'booking'=>'home#create', as: :booking
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
