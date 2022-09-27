class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_order

  def authenticate_admin_user!
    redirect_to root_path unless current_user.role_admin?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  def current_order
    Order.find_or_create_by(user: current_user, status: Order.statuses[:in_progress])
  end

end
