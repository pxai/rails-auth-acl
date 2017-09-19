class LoggedController < ApplicationController
  before_filter :check_login

  def admin_only
    unless user_is_admin
      redirect_to home_index_path, :notice => "Access denied."
    end
  end

  private
  ADMIN_ROLE = 2

  def user_is_admin
    user = User.find(session[:user]['id'])
    puts "This always works"
    logger.info "Info works"
    logger.warn "Warn works"
    logger.debug "Checking user roles for #{user.login}"
    user.user_roles.each do |r|
      logger.debug "Role #{r.role_id}"
      if r.role_id == ADMIN_ROLE
        logger.debug "Yeah, it is admin #{r.role_id}"
        return true
      end
    end
    return false
  end

end
