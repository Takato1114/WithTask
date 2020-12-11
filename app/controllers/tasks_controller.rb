class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.where(user_id: current_user.id).rank(:row_order)
    # .where('start_date <= ?', Date.today).where('end_date >= ?', Date.today)
    # @tasks = Task.where(user_id: current_user.id).rank(:row_order)
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save(task_params)
      flash[:success] = "タスクの登録が完了しました。"
      redirect_to homes_top_path
    else
      flash[:danger] = "タスクの登録に失敗しました。※タイトル・開始日時・終了日時は必須です。"
      @tasks = Task.where(user_id: current_user.id)
      redirect_to homes_top_path
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "タスクの削除が完了しました。"
    redirect_to homes_top_path
  end

  def edit
    @task = Task.find(params[:id])

  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "タスクの更新が完了しました。"
       redirect_to homes_top_path
    else
      flash[:danger] = "タスクの更新に失敗しました。※タイトル・開始日時・終了日時は必須です。"
      @tasks = Task.where(user_id: current_user.id)
      redirect_to homes_top_path
    end
  end

  def update_status
    @task = Task.find(params[:task_id])
    if @task.update(task_params)
       redirect_to tasks_path
    else
    render 'index'
    end
  end

  def search
    # ワード検索の場合
    if params[:search].present?
      @tasks = Task.search(params[:search])
    # 並び替えの場合
    elsif params[:sort].present?
      @tasks = Task.sort(params[:sort])
    end
    render 'index'
  end

  def sort
    task = Task.find(params[:task_id])
    task.update(task_params)
    render body: nil
  end

  private
    def task_params
      params.require(:task).permit(:title, :content, :start_date, :end_date, :status, :user_id, :row_order_position)
    end

end
