class RailsAdminLocaleController < ActionController::Base
  before_action :set_locale
 
  def set_locale
    I18n.locale = :en
  end
   
  protect_from_forgery with: :exception

end
