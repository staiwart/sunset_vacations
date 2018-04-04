Rails.application.routes.draw do
  
  get 'web_pages/home'
  get 'web_pages/about'
  get 'web_pages/cities'
  get 'web_pages/toptens'
  get 'web_pages/packages'

  root 'application#teapot'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
