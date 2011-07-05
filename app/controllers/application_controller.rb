class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate

  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == 'bigrock' && password == 'littlerooster' 
    end
  end
end
