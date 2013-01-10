class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :authenticate
  before_filter :last_index!, only:[:index]

  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == 'bigrock' && password == 'littlerooster' 
    end
  end

  def last_index!
    session[:last_index] = request.url
  end
  
  def last_index
    session[:last_index] || root_url 
  end

end
