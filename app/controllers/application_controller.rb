# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
end
class ApplicationController < ActionController::Base
  before_action :redirect_to_splash

  private

  def redirect_to_splash
    if params[:controller] == "pages" && params[:action] == "home"
      redirect_to splash_path unless session[:splash_seen]
      session[:splash_seen] = true
    end
  end
end
