class BeekeepersController < ApplicationController

  def index

  end   

  def new 
  end 

  def create
    @beekeeper = Beekeeper.new(
                              first_name: params[:first_name],
                              last_name: params[:last_name],
                              email: params[:email],
                              password: params[:password],
                              password_confirmation: params[:password_confirmation]
                              )
       if @beekeeper.save
      session[:beekeeper_id] = @beekeeper.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
  
  

end
