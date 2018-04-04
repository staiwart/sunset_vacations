Rails.application.routes.draw do
  
  get 'web_pages/home'
  get 'web_pages/about'

  root 'application#teapot'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
