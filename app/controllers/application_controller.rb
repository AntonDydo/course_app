class ApplicationController < ActionController::Base
  around_action :switch_locale
  before_action :authenticate_user!

  def default_url_options
    { locale: I18n.locale }
  end

  def set_cookie
    cookies[:locale] = { value: params[:locale], expires: Time.now + 3000000 }
    cookies[:theme] = { value: params[:theme], expires: Time.now + 3000000 }
    redirect_back fallback_location: root_path
  end

  private

  def switch_locale(&block)
    locale = cookies[:locale] || I18n.default_locale
    I18n.with_locale(locale, &block)
  end
end
