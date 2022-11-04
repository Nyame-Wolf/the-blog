class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_author!

  # to change fro default current_user to current_author
  def current_ability
    @current_ability ||= Ability.new(current_author)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer
      .permit(:sign_up, keys: [:name])
  end
end
