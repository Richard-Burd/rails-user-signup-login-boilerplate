class ApplicationController < ActionController::Base

  # Prevent CRSF attacks by raising an exception
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authentication_required
    if !logged_in? # that is, if you are NOT logged in.
      redirect_to login_path
    end
  end

  # Only the authentication_required method above should use this logged_in? method.
  # Object controllers should call the current_user method as shown in the
  # index action of the site controller in: app/controllers/site_controller.rb
  def logged_in?
    # if you are not-not-the current user, that means you ARE the current user.
    !!current_user
  end

  def current_user
    # I am still looking for where Avi explains how this works
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Methods you build in controllers do not permeate to
  # the ActionView part of your code...
  # You cannot call this in your html.erb unless you say explicitly That
  # this is a "helper_method"
  helper_method :current_user
end
