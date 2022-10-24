class AuthorsController < ApplicationController
  def index; end

  def show
    params[:author_id]
  end
end
