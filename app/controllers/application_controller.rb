class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    case resource
    when Client then
      cars_path
    when User then
        root_path
    end
  end

  def after_sign_up_path_for(resource)
    if current_client.has_role? :admin
     cars_path
    else
    root_path
    end
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:companyname,:image,:country_cont,:address,:phone,:state_cont,:fname,:lname,:role])
  end


end
