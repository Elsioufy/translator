module ApplicationHelper
  def datetime_ago(datetime)
    t('updated') + ' ' + time_ago_in_words(datetime) + ' ' + t('ago')
  end
end
