class ApplicationController < ActionController::Base
  before_action :authenticate_author!
end
