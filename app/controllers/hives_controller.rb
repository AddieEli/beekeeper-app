class HivesController < ApplicationController

  def index
    @hives = current_beekeeper.hives


  end

  def new
    @hive = Hive.new
  end

  def create
       @hive = Hive.new(
                      hive_name: params[:hive_name],
                      bee_breed: params[:bee_breed],
                      hive_style: params[:hive_style],
                      hive_address: params[:hive_address],
                      hive_city: params[:hive_city],
                      hive_state: params[:hive_state] 
                    )
      if @hive.save
        
      join = BeekeeperHive.new(
                          hive_id: @hive.id,
                          beekeeper_id: current_beekeeper.id
                          )
      join.save

      redirect_to "/hives/#{@hive.id}"
    end
  end 

  def show
      @hive = Hive.find(params[:id])
     @log = Log.where(hive_id: @hive.id)
  end

end

