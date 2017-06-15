class SessionsController < ApplicationController
  before_action
  def new
  end 

  def create
    beekeeper = Beekeeper.find_by(email: params[:email])
    if beekeeper && beekeeper.authenticate(params[:password])
      session[:beekeeper_id] = beekeeper.id
      redirect_to '/'
    else 
      redirect_to '/signup'
    end
  end

  def destroy
    session[:beekeeper_id] = nil
    redirect_to '/signup'
  end

end
