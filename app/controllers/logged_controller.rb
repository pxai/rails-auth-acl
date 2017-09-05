class LoggedController < ApplicationController
  before_filter :check_login

  def admin_only
    unless current_user.admin?
      redirect_to :back, :notice => "Access denied."
    end
  end

end
