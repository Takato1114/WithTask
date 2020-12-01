class ArticleCommentsController < ApplicationController
  
  def create
    @article = Article.find(params[:article_id])
    @article_comment = current_user.article_comments.new(article_comment_params)
    @article_comment.article_id = @article.id
    if @article_comment.save
      redirect_to article_path(@article.id)
    else
      @user = User.find(current_user.id)
      render  "articles/show"
    end
  end

  def destroy
    ArticleComment.find_by(id: params[:id], article_id: params[:article_id]).destroy
    @article = Article.find(params[:article_id])
    redirect_to article_path(@article.id)
  end
  
  private
  def article_comment_params
    params.require(:article_comment).permit(:comment)
  end
  
end
