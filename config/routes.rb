Rails.application.routes.draw do
  
  # Camper routes
  get '/campers', to: 'campers#index'
  get '/campers/:id', to: 'campers#show'
  post '/campers', to: 'campers#create'

  # Activities routes
  get '/activities', to: 'activities#index'
  delete '/activities/:id', to: 'activities#destroy'

  #Signup routes
  post '/signups', to: 'signups#create'
end
