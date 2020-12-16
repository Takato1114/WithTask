class HomesController < ApplicationController

  before_action :login_check, only: [:top_after_login]
  before_action :login_check_top, only: [:top_before_login]


  def top_before_login
  end

  def top_after_login
    @task = Task.new
    @tasks = Task.where(user_id: current_user.id)
  end

  def about
  end

  private
  def login_check
    unless user_signed_in?
      redirect_to '/'
    end
  end

  def login_check_top
    if user_signed_in?
      redirect_to homes_top_path
    end
  end

end
