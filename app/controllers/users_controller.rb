class UsersController < ApplicationController
  def show
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
       redirect_to user_path(current_user.id) ,notice: "successfully updated."
    else
    render :edit
    end
  end

  def unsubscribe
  end

  def quit_update
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email)
  end

end
