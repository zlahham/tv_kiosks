class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, unless: -> { devise_controller? || is_a?(KioskController) }
end
