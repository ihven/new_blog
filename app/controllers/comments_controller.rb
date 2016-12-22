class CommentsController < ApplicationController
    
    before_filter :authenticate_user!, :only => [:create, :destroy]
    
    def create
      @article = Article.find(params[:article_id])
    #  @article.comments.create(comments_param)
       aa =  @article.comments.new(comments_param)
       aa.author = current_user.username
       aa.save
      
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
      params.require(:comment).permit(:author,:body)
    end 
end
