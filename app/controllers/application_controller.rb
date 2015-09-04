class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_tenant
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:avatar, :first_name, :last_name, :username, :email, :password, :password_confirmation, :remember_me, :gender) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :avatar, :last_name, :name, :username, :change_email, :password, :password_confirmation, :current_password, :gender, :city, :state, :country, :website, :facebook, :twitter, :google, :pinterest, :description, affiliations_attributes: [:id, :name, :affiliation_category_id, :_destroy], awards_attributes: [:id, :title, :year, :image, :description, :_destroy], experiences_attributes: [:id, :job_title, :start_year, :end_year, :company, :company_logo, :_destroy]) }
  end
end
