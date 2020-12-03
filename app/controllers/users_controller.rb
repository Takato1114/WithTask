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
    @user = current_user
  end

  def quit_update
    @user = User.find(current_user.id)
    @user.update(quit_flag: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email)
  end

end
