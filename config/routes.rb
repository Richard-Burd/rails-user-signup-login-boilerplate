Rails.application.routes.draw do

  # for the convoy app, we need to nest the vehicle resources into the user ones
  # resources :users,  :only => [:new, :create]

  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"

  # ROUTES FOR RAILS CONVOY APP
  get '/homeapp' => "site#homeapp"
  resources :trips

  # for the convoy app, we need to nest the vehicle resources into the user ones
  resources :users do
    resources :vehicles
  end
  # END ROUTES FOR RAILS CONVOY APP

  # https://www.youtube.com/watch?v=UAvuo-EbTFY (10:14 / 56:18)
  # OmniAuth Video
  get '/auth/:provider/callback' => 'sessions#create'

  # get 'items/create'
  # This line was added with the following command:
  # $ rails g resource list name --no-test-framework
  #resources :lists

  # Because Items only exist in the context of Lists, I need to create a nested resource
  resources :lists do
    resources :items
  end


  get 'site/index'
  # https://www.youtube.com/watch?v=Bltz_Dz8bSw (8:08 of 56:55)
  root 'site#index'
  # Per this lesson here:
  # https://learn.co/tracks/full-stack-web-development-v8/module-13-rails/section-5-crud-with-rails/rails-generators
  # The following command was enterefd:
  # .../rails-sandbox-1$ rails g controller admin dashboard stats financials settings --no-test-framework
  #...and it generates the following output, creating a bunch of stuff:

  # Running via Spring preloader in process 44873
  #       create  app/controllers/admin_controller.rb
  #        route  get 'admin/dashboard'                      <= This is in this file below!
  # get 'admin/stats'                                        <= This is in this file below!
  # get 'admin/financials'                                   <= This is in this file below!
  # get 'admin/settings'                                     <= This is in this file below!
  #       invoke  erb
  #       create    app/views/admin
  #       create    app/views/admin/dashboard.html.erb
  #       create    app/views/admin/stats.html.erb
  #       create    app/views/admin/financials.html.erb
  #       create    app/views/admin/settings.html.erb
  #       invoke  helper
  #       create    app/helpers/admin_helper.rb
  #       invoke  assets
  #       invoke    scss
  #       create      app/assets/stylesheets/admin.scss
  get 'admin/dashboard'   #=> generated with this command: /rails-sandbox-1$ rails g controller admin dashboard stats financials settings --no-test-framework
  get 'admin/stats'       #=> generated with this command: /rails-sandbox-1$ rails g controller admin dashboard stats financials settings --no-test-framework
  get 'admin/financials'  #=> generated with this command: /rails-sandbox-1$ rails g controller admin dashboard stats financials settings --no-test-framework
  get 'admin/settings'    #=> generated with this command: /rails-sandbox-1$ rails g controller admin dashboard stats financials settings --no-test-framework


  # IF YOU WANT TO SEE THE ROUTES *JUST* FOR "ADMIN" - DO THIS:
  # .../rails-sandbox-1$ rails routes | grep admin
  #                    admin_dashboard GET    /admin/dashboard(.:format)                                                               admin#dashboard
  #                        admin_stats GET    /admin/stats(.:format)                                                                   admin#stats
  #                   admin_financials GET    /admin/financials(.:format)                                                              admin#financials
  #                     admin_settings GET    /admin/settings(.:format)                                                                admin#settings



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'about', to: 'static#about'
  get 'home', to: 'posts#home'
  # We still need to draw one additional route to handle the update action...
  # patch 'posts/:id', to: 'posts#update'

  # get 'posts', to: 'posts#index'

  # https://learn.co/tracks/full-stack-web-development-v7/rails/intro-to-rest/rails-dynamic-request
  # There are a few elements of the application that can be refactored.
  # Instead of the long, drawn out get route we placed in our routes.rb file,
  # we can use Ruby's RESTful defaults and the resources method.

  # get 'posts/:id', to: 'posts#show'
  # resources :posts, only: :show
  # You can just write this if you want and it will still work:
  resources :posts
  resources :authors

  # We cal also be specific:
  # resources :posts, only: [:index, :new]
  # resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  # https://learn.co/tracks/full-stack-web-development-v8/module-13-rails/section-5-crud-with-rails/edit-update-action
  # To start off, let's draw a get route for our edit form.
  # Since the form will need to know which record is being edited,
  # this will need to be a dynamic route that accepts an :id as a
  # parameter that the controller can access:
  # get 'articles/:id/edit', to: 'articles#edit', as: :edit_article

end
