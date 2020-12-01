class ArticlesController < ApplicationController
  def new
    # byebug
    @article = Article.new
    @task = Task.find(params[:task_id])
    # @article.task_id = params[:task_id]
  end

  def index
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    # byebug
    if @article.save(article_params)
      redirect_to article_path(@article.id)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private
    def article_params
      params.require(:article).permit(:explanation, :genre, :reference_url, :task_id)
    end

end
