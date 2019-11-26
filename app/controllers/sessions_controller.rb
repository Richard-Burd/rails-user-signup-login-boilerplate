class SessionsController < ApplicationController
  # this has the "Home" and "Logout" links at the bottom of each pags
  # and is located here: app/views/layouts/homeapp.html.erb
  layout "homeapp"

  def new
    @user = User.new
  end

  def create
    # Here is where the code will login using Omniauth-GitHub
    if auth_hash = request.env["omniauth.auth"]
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = user.id
      # raise params.inspect #=> you can enter these queries into the Rails web console and obtain the relevant values:
      # auth_hash[:info][:name]...request.env[:omniauth.auth][:credentials][:token]...request.env[:omniauth.auth][:provider]
      redirect_to root_path
    else # If there's no auth_hash, the user isn't using OmniAuth, so at this point the code will sign them in with their email & password
      # raise params.inspect #=> you can enter these queries into the Rails web console and obtain the relevant values:
      # params[:email]...params[:password]...params[:authenticity_token]...if these don't show up, something is broken
      user = User.find_by(:email => params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path
      else
        flash[:notice] = "You must enter a valid email & password"
        redirect_to login_path
      end
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end
