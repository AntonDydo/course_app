Rails.application.routes.draw do
  root "reviews#index"
  devise_for :users
  get 'person/profile', to: 'persons#profile'
  resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
