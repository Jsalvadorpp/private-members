Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'events#index' , as: 'home'

  get '/signup' => 'users#new'  , as: 'signup'
  get '/profile' => 'users#profile' , as: 'profile'
  post '/signup' => 'users#create'

  get '/login' => 'session#login' , as: 'login'
  post '/login' => 'session#create'
  delete '/logout' => 'session#logout', as: 'logout'
end
