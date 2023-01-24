Rails.application.routes.draw do

  root :to => 'pages#home'

  resources :users, :only => [:new, :create]
  resources :roots
  resources :concepts
  get '/search', to: 'search#index'
  get '/concepts/index/search', to: 'concepts#index', :as => 'search_concepts'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
