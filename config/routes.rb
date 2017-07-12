Rails.application.routes.draw do

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
  get '/hives/:id/edit' => 'hives#edit'
  patch '/hives/:id' => 'hives#update'
  delete '/hives/:id' => 'hives#destroy'

  get '/logs' => 'logs#index'
  get '/hives/:hive_id/logs/new' => 'logs#new'
  post '/logs' => 'logs#create'
  get '/hives/:hive_id/logs/:id/edit' => 'logs#edit'
  patch '/hives/:hive_id/logs/:id' => 'logs#update'
  delete '/logs/:id' => 'logs#destroy'

  # namespace :api do
  #   namespace :v1 do
  #     get '/hives' => 'hives#index'
  #     post '/hives' => 'hives#create'
  #     patch '/hives/:id' => 'hives#update'
  #     get '/hives/:id' => 'hives#show'
  #   end
  # end

  

end
