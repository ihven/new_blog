class CommentsController < ApplicationController
    def create
      @article = Article.find(params[:article_id])
      @article.comments.create(comments_param)
      redirect_to article_path(@article)
    end 

    def destroy
       @article = Article.find(params[:article_id])
       @comment = @article.comments.find(params[:id])
       @comment.destroy
       
       redirect_to article_path(@article)
    end 

    private     

    def comments_param
      params.require(:comment).permit(:author, :body)
    end 
end
