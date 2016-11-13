class SessionsController < ApplicationController

def new


end

def create
  # right now we are using a local variable because we don't need to display it to the views
  user = User.find_by_email params[:email].downcase
  # looks user up by email and assigns to user variable
  # byebug
  # if user for that email exists and the password for that user is correct store the user id in the browser session
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    # storing user.id into the cookie = session?
    redirect_to home_path, notice: 'Signed In'
  else
    flash.now[:alert] = 'Wrong credentials'
    render :new
  end
end

def destroy
  # deletes the user id from the browser session and set it to nil
  session[:user_id] = nil
  redirect_to home_path, notice: "signed out"
end




    # authenticate is hashing the password and then seeing if it matches the database password

    # *****binary search requires things to be sorted, check one end start checking from the middle
    # engineers and programmers shi zao fu zhe ge shi je de
end
