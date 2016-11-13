class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def autheticate_user
    redirect_to new_session_path, alert: 'please sign in' unless user_signed_in?
  end
  helper_method :authenticate_user



  def user_signed_in?
    # checks that the sessions hash has a value for the user_id key and that the value is not nil.
    session[:user_id].present?
  end
  # right now we can't access this function therefore we need the helper_method so every page in views can access this method

  helper_method :user_signed_in?

  # local variable is gonna give error if it's not defined
  # instance variable is always gonna defined, it's gonna return something. @current_user is nil
  def current_user
  @current_user ||= User.find(session[:user_id]) if user_signed_in?
  end
  helper_method :current_user
  # checks to see if a user is sign in, if not, don't run the user look up code, becuse it will break when looking up nil, no user logged in means a session is nil
  # application_controller shows up on all the controllers because all the controller inherit application_controller

  # helper_method so that it shows up in the views file because views don't inherit from the application controller
end
