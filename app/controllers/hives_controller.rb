class HivesController < ApplicationController

  def index
    @hives = Hive.all

  end

  def new
    @hive = Hive.new
  end

  def create
       @hive = Hive.new(
                      bee_breed: params[:bee_breed],
                      hive_style: params[:hive_style],
                      hive_address: params[:hive_address],
                      hive_city: params[:hive_city],
                      hive_state: params[:hive_state]
                    )
    if @hive.save
      redirect_to '/hives/:id'
    end
  end 
end

