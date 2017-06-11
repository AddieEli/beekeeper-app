class SessionsController < ApplicationController

  def new
    render 'new.html.erb'
  end 

  def create
    beekeeper = Beekeeper.find_by(email: params[:email])
      if beekeeper && beekeeper.authenticate(params[:password])
        session[:beekeeper.id] = beekeeper.id
        redirect_to '/'
      else redirect_to '/login'
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
    
  end

end
