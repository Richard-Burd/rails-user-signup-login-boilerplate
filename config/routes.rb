Rails.application.routes.draw do

  # This is the page your app will display when you go to the root URL
  root 'site#index' # this uses the "#" notation
  get 'site/index'  # this uses the "/" notation - it's interchangeable with the one above

  # These are the routes used to manage users
  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"
  get '/auth/:provider/callback' => 'sessions#create' # OmniAuth : https://www.youtube.com/watch?v=UAvuo-EbTFY (10:14 / 56:18)

  # This route grabs the homepage for the actual app you're building
  get '/homeapp' => "site#homeapp"

end
