class HomesController < ApplicationController
  def top_before_login
  end

  def top_after_login
    @task = Task.new
    @tasks = Task.where(user_id: current_user.id)
  end

  def about
  end

end
