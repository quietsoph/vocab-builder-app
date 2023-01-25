Rails.application.routes.draw do

  root :to => 'pages#home', :as => 'home'

  resources :users, :only => [:index, :new, :create]
  resources :roots
  resources :concepts
  get '/search', to: 'search#index', :as => 'search_roots'
  get '/concepts/index/search', to: 'concepts#index', :as => 'search_concepts'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
