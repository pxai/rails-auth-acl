class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  def check_login
    if !session[:user_id]
      puts t('not-logged').red
      redirect_to '/home/index'
    else
      puts session[:user_id].to_s.green
    end
  end

  def set_locale
    I18n.locale = params[:locale] || extract_locale_from_subdomain||  I18n.default_locale
  end

  def extract_locale_from_subdomain
    parsed_locale = request.subdomains.first
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end
end
