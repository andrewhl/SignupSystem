class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
    if not current_user.admin?
      flash.now[:notice] = "You must be signed in as an admin to view this page."
    end
  end
end