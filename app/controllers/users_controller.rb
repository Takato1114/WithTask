class UsersController < ApplicationController

  before_action :login_check, only: [:show, :edit, :unsubscribe]

  def mypage
    @articles = Article.where(user_id: current_user.id)
  end

  def show
    @user = User.find_by(id: params[:id])
    @articles = Article.where(user_id: params[:id])
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.email == 'guest@example.com'
      redirect_to users_mypage_path, alert: 'ゲストユーザー情報は変更できません。'
    elsif @user.update(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
       redirect_to users_mypage_path
    else
      flash[:danger] = "ユーザー情報の更新に失敗しました。"
    render :edit
    end
  end

  def unsubscribe
    @user = current_user
  end

  def destroy
    @user = User.find(current_user.id)
    if @user.email == 'guest@example.com'
      redirect_to users_mypage_path, alert: 'ゲストユーザーは削除できません。'
    else
      @user.destroy
      reset_session
      flash[:success] = "ありがとうございました。またのご利用を心よりお待ちしております。"
      redirect_to '/'
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email)
  end

  def login_check
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
