module ApplicationHelper
  def datetime_ago(datetime)
    begin
      timeago_tag datetime, :nojs => true, :lang => I18n.locale
    # rescue
    end
  end
end
