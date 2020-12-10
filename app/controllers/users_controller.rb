class UsersController < ApplicationController
  def show
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
       redirect_to user_path(current_user.id)
    else
      flash[:danger] = "ユーザー情報の更新に失敗しました。"
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
    flash[:success] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email)
  end

end
