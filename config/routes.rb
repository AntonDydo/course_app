  Rails.application.routes.draw do

      root "reviews#index"
      get  'reviews/popular', to: 'reviews#popular', as: 'showpopular'
      get  'reviews/sort', to: 'reviews#sort', as: 'sort'
      get 'person/profile/:id', to: 'persons#profile', as: 'profile'
      resources :reviews
      get 'favorites/:id', to: 'reviews#favorite', as: 'favorited'
      get 'unfavorites/:id', to: 'reviews#unfavorite', as: 'unfavorited'
      get 'set', to: 'application#set_cookie', as: 'cookieset'
      get 'results', to: 'results#index', as: 'results'
      get 'vote/:id', to: 'reviews#voted', as: 'vote'
      devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
