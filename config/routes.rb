Rails.application.routes.draw do

  root 'web_pages#home'
  get '/about', to: 'web_pages#about'
  get '/countries', to: 'web_pages#countries'
  get '/toptens', to: 'web_pages#toptens'
  get '/packages', to: 'web_pages#packages'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
