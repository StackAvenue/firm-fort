class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :accept_invitation, keys: [:first_name, :last_name, :invitation_status]
  end
end
