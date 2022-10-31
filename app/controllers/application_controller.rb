class ApplicationController < ActionController::Base
  def current_user
    Author.first
  end
end
