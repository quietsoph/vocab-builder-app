Rails.application.routes.draw do

  root :to => 'pages#home', :as => 'home'

  resources :users, :only => [:index, :new, :create]
  resources :families
  resources :concepts
  get '/families/search', to: 'family#index', :as => 'search_family'
  get '/concepts/index/search', to: 'concepts#index', :as => 'search_concept'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
