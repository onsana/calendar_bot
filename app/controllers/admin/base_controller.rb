class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  layout "admin" 
  before_action :ensure_admin!

  private

  def ensure_admin!
    unless current_user.admin?
      sign_out current_user

      redirect_to root_path

      return false
    end
  end
end
