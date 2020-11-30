class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.where(user_id: current_user.id).rank(:row_order)
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
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])

  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
       redirect_to task_path(@task.id) ,notice: "successfully updated."
    else
    render :edit
    end
  end

  def sort
    task = Task.find(params[:task_id])
    task.update(task_params)
    render body: nil
  end

  private
    def task_params
      params.require(:task).permit(:task_name, :task_summary, :deadline, :scheduled_time, :row_order_position)
    end

end
