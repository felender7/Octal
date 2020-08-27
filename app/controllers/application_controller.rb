class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_counter
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :masquerade_user!

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
    end

    def get_counter
      if user_signed_in?
      @question_count = current_user.succours.count
      @support_count = current_user.supports.count
    end
    end
end
