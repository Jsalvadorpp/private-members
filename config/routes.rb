Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'events#index' , as: 'home'

  get '/signup' => 'users#new'  , as: 'signup'
  post '/signup' => 'users#create'

end
