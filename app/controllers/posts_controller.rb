class PostsController < ApplicationController
  def index
    @author = Author.find(params[:author_id])
    @author.posts.includes(%i[comments likes])
  end

  def show
    @author = Author.find(params[:author_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_author
    if @post.save
      redirect_to author_path(current_author.id)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to author_path(current_author), notice: 'Post was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
