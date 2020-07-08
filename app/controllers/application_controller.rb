class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :set_ancestry
  before_action :configure_permitted_parameters, if: :devise_controller?


  private
  def production?
    Rails.env.production?
  end
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end
  def after_sign_out_path_for(resource)

    root_path

  end

  def set_ancestry
    @parent = Category.where(ancestry: nil)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :first_name_kana, :family_name_kana, :birth_day])
  end
end