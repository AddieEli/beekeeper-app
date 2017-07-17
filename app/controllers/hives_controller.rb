class HivesController < ApplicationController
before_action :authenticate_user!

  def index
    @hives = current_beekeeper.hives.where(parent_id: nil)
    @log = Log.last 

  end

  def new
    @hive = Hive.new
  end

  def create
       @hive = Hive.new(
                      hive_name: params[:hive_name],
                      bee_breed: params[:bee_breed],
                      hive_style: params[:hive_style],
                      street: params[:street],
                      hive_city: params[:hive_city],
                      hive_state: params[:hive_state],
                      hive_origin: params[:hive_origin],
                      queen_origin: params[:queen_origin]
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

    city = @hive.hive_city || "Chicago"
    state = @hive.hive_state || "IL"

     @channel = Unirest.get(URI.decode("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{ city }%2C%20#{ state }%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")).body["query"]["results"]["channel"]

    @temperature = @channel["item"]["condition"]["temp"]
    @temp_measure = @channel["units"]["temperature"]

    @city = @channel["location"]["city"]
    @state = @channel["location"]["region"]

    @forecasts = @channel["item"]["forecast"].first(5)

    @hive.geocode

    @internal = Unirest.get(URI.decode("https://api.particle.io/v1/devices/380032000651353530373132/pool_tmp?access_token=a6d70792fd8cbe5a00d67b2c28dc85264a12457e")).body["result"]
    


  end

  def edit
    @hive = Hive.find(params[:id])
  end

  def update
    @hive = Hive.find(params[:id])
      @hive.assign_attributes(
                              hive_name: params[:hive_name],
                              bee_breed: params[:bee_breed],
                              hive_style: params[:hive_style],
                              street: params[:street],
                              hive_city: params[:hive_city],
                              hive_state: params[:hive_state],
                              hive_origin: params[:hive_origin],
                              queen_origin: params[:queen_origin]
                              )
    if @hive.save
      flash[:success] = "Hive Information Updated"
      redirect_to "/hives/#{@hive.id}"
    end 

  end 

  def destroy
    hive = Hive.find(params[:id])
    hive.destroy
    redirect_to "/"
  end 

end

