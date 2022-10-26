class PostsController < ApplicationController
  def index
    @author = Author.find(params[:author_id])
  end

  def show
    @author = Author.find(params[:author_id])
    @post = Post.find(params[:id])
  end
end
