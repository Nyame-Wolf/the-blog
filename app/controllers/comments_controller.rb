class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @author = Author.find(params[:author_id])
    @post = Post.find(params[:post_id])
    @comment.author = current_user
    @comment.post = @post

    if @comment.save
      redirect_to author_post_path(@author, @post)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
