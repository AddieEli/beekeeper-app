Rails.application.routes.draw do

  get '/beekeepers' => 'beekeepers#index'
  get '/' => 'beekeepers#index'

  get '/signup' => 'beekeepers#new'
  post '/beekeepers' => 'beekeepers#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout'=> 'sessions#destroy'

  get '/hives' => 'hives#index'
  get '/hive' => 'hives#new'
  post '/hives' => 'hives#create'
  get '/hives/:id' => 'hives#show'
  delete '/hives/:id' => 'hives#destroy'

  get '/logs' => 'logs#index'
  get '/hives/:hive_id/logs/new' => 'logs#new'
  post '/logs' => 'logs#create'
  delete '/logs/:id' => 'logs#destroy'

  

end
