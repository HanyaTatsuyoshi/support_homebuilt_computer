class ApplicationController < ActionController::Base
  before_action :store_user_location!, if: :storable_location?
  
  private

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end
  
  def after_sign_out_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end
  
  
  def after_sign_in_path_for(resource_or_scope)
    if session[:after_login_to_custom]
      after_login_to_custom_path
    else
      stored_location_for(resource_or_scope) || super
    end
  end
end
