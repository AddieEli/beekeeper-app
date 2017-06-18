class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_beekeeper
    @current_beekeeper ||= Beekeeper.find_by(id: session[:beekeeper_id]) if session[:beekeeper_id]
  end
  helper_method :current_beekeeper

  def authenticate_user!
    redirect_to "/login" unless current_beekeeper 
  end 
  
end
