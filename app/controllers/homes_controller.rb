class HomesController < ApplicationController
  def top_before_login
  end

  def top_after_login
    @task = Task.new
    @tasks = Task.where(user_id: current_user.id).rank(:row_order)
  end

  def about
  end

end
