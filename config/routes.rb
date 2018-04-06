Rails.application.routes.draw do
  
  get 'sessions/new'

  root 'web_pages#home'
  get '/about', to: 'web_pages#about'
  get '/countries', to: 'web_pages#countries'
  get '/toptens', to: 'web_pages#toptens'
  get '/packages', to: 'web_pages#packages'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'sessions#destroy'

end
