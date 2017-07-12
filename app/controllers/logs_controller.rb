class LogsController < ApplicationController
 before_action :authenticate_user! 
  def index
    @logs = Log.all
  end

  def new
    @hive = Hive.find(params[:hive_id])
  end

  def create
    @hive = Hive.find(params[:hive_id])
    @log = Log.create!(
                    notes: params[:notes],
                    hive_general_status: params[:hive_general_status],
                    queen: params[:queen],
                    larva: params[:larva],
                    comb_build: params[:comb_build],
                    hive_id: @hive.id
                    )
      @log.save
     
      redirect_to "/hives/#{@log.hive_id}"
      
  end 

  def destroy
    log = Log.find(params[:id])
    log.destroy
    flash[:warning] = "This entry has been deleted"
    redirect_to '/hives' 
  end

  def edit
    @hive = Hive.find(params[:hive_id])
    @log = Log.find(params[:id]) 
  end

  def update
    @hive = Hive.find(params[:hive_id])
    @log = Log.find(params[:id])
      @log.assign_attributes(
                              notes: params[:notes],
                              hive_general_status: params[:hive_general_status],
                              queen: params[:queen],
                              larva: params[:larva],
                              comb_build: params[:comb_build],
                              hive_id: @hive.id
                            )
      @log.save
      redirect_to "/hives/#{@log.hive_id}"
  end


end



