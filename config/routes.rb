Rails.application.routes.draw do

  get 'profile/index'
  resources :cars

  get 'business/index', as: :business
  devise_for :users
  devise_for :clients, path: 'clients'
  get 'search' => 'home#search', as: :search
  post'book'=>'home#book',as: :book
  get 'booking'=>'home#create', as: :booking
  get 'invoice'=>'profile#invoice', as: :invoice
  get 'customer'=>'customer#index', as: :customer
  get 'states'=>'home#index'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
