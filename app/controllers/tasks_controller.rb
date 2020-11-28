class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.where(user_id: current_user.id)
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save(task_params)
      redirect_to tasks_path
    else
      render 'index'
    end
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private
    def task_params
      params.require(:task).permit(:task_name, :task_summary, :deadline, :scheduled_time)
    end

end
