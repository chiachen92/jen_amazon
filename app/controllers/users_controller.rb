class UsersController < ApplicationController
  def new
  @user = User.new

  end


  def create

  # @user = User.find params[:user_id], store user_id into cookie
  user_params = params.require(:user).permit([:first_name, :last_name, :email, :password, :password_confirmation])
  @user = User.new user_params

    if @user.save
    session[:user_id] = @user.id
    redirect_to home_path, notice: "New user created!"
    else
    render :new
    end
  # @answer = child
  # @question = parent
  # parent of this current child is = to the current parent
  end



end
