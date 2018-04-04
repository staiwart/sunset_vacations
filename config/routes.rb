Rails.application.routes.draw do
  
  root 'web_pages#home'
  get 'web_pages/home'
  get 'web_pages/about'
  get 'web_pages/cities'
  get 'web_pages/toptens'
  get 'web_pages/packages'

end
