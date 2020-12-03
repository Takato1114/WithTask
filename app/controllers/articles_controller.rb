class ArticlesController < ApplicationController
  def new
    @article = Article.new
    @task = Task.find(params[:task_id])
    # @article.task_id = params[:task_id]
  end

  def index
    @tag_list = Tag.all
    if params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      @articles = @tag.articles.order(created_at: :desc)
    else
    @articles = Article.all

    end
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save(article_params)
      tag_list = params[:article][:tag_name].split(/[[:blank:]]+/).select(&:present?)
       @article.save_tags(tag_list)
      redirect_to article_path(@article.id)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
    @article_comment = ArticleComment.new
    @article_tags = @article.tags
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
    @article_tags = @article.tags.pluck(:tag_name).join(" ")
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      tag_list = params[:article][:tag_name].split(/[[:blank:]]+/).select(&:present?)
       @article.save_tags(tag_list)
      redirect_to article_path(@article.id) ,notice: "successfully updated."
    else
    render :edit
    end
  end

  def search
    @articles = Article.search(params[:search])
  end

  private
    def article_params
      params.require(:article).permit(:title, :explanation, :reference_url, :task_id)
    end

    def tag_params
      params.require(:article).permit(:tag_names)
    end

end
