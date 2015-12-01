class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :middle_name, :email, :country, :city, :phone, :degree, :biography, :speech_experience, :password, :password_confirmation, :avatar) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :middle_name, :email, :country, :city, :phone, :degree, :biography, :speech_experience, :password, :password_confirmation, :current_password, :avatar) }
  end

  def after_sign_in_path_for(resource)
    profile_path
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    {:locale => I18n.locale}
  end

  def render_404
    render 'errors/404', :status => :not_found
  end

  def render_403
    render 'errors/403', :status => :forbidden
  end
end
