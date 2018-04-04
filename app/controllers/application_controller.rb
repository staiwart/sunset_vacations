class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def teapot
    render html: "I'm a little teapot, short and stout!"
  end
end
