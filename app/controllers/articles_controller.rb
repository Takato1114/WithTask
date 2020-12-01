class ArticlesController < ApplicationController
  def new
    # byebug
    @article = Article.new
    @task = Task.find(params[:task_id])
    # @article.task_id = params[:task_id]
  end

  def index
    @articles = Article.all
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
    @article_comment = ArticleComment.new
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article.id) ,notice: "successfully updated."
    else
    render :edit
    end

  end

  private
    def article_params
      params.require(:article).permit(:title, :explanation, :genre, :reference_url, :task_id)
    end

end
