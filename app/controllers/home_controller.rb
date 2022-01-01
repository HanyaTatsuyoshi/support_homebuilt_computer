class HomeController < ApplicationController
  def after_login_to_custom
    if session[:after_login_to_custom]
      @back_controller = session[:after_login_to_custom]['controller_name']
      @back_action = session[:after_login_to_custom]['action_name']
      @params = session[:after_login_to_custom]['params']
      session[:after_login_to_custom] = nil
      render :after_login_to_custom, layout: false
    else
      redirect_to root_path
    end
  end
end
