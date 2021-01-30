class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to root_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :accept_invitation, keys: [:first_name, :last_name, :invitation_status]
  end
end
