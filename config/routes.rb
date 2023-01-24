Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :roots
  resources :concepts
  get '/search', to: 'search#index'
  get '/concepts/index/search', to: 'concepts#index', :as => 'search_concepts'
  
end
