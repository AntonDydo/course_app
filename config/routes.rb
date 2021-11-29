  Rails.application.routes.draw do
  scope '(:locale)', locale: /en|ru/ do
    root "reviews#index"
    devise_for :users
    get 'person/profile', to: 'persons#profile'
    resources :reviews
    get 'favorites/:id', to: 'reviews#favorite', as: 'favorited'
    get 'unfavorites/:id', to: 'reviews#unfavorite', as: 'unfavorited'
    get 'set', to: 'application#set_cookie', as: 'cookieset'
    get 'results', to: 'results#index', as: 'results'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
