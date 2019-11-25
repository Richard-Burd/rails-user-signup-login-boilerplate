class SiteController < ApplicationController

  # this will specify to use the formatting in app/views/layouts/homeapp.html.erb
  layout "homeapp"

  def index
    # @user = User.find(params[:user_id])
    # render :plain => "This is the startpoint of the site"
    if current_user
      @user = current_user
      # render :plain => "a user is logged in"
      render 'homeapp'
    end
  end

  def homeapp
    if !current_user
      redirect_to root_path
    end
  end
end
