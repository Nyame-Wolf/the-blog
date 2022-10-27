class LikesController < ApplicationController
  def create
    @like = Like.new
    @author = Author.find(params[:author_id])
    @post = Post.find(params[:post_id])
    @like.author = current_user
    @like.post = @post

    if @like.save
      redirect_to author_post_path(@author, @post)
    else
      render :new
    end
  end
end
