Rails.application.routes.draw do
  
  root 'web_pages#home'
  get '/about', to: 'web_pages#about'
  get '/cities', to: 'web_pages#cities'
  get '/toptens', to: 'web_pages#toptens'
  get '/packages', to: 'web_pages#packages'

end
