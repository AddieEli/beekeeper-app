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
      beekeeper.save!
      redirect_to '/'
  end

end
