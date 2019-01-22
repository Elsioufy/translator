module ApplicationHelper

  def switch_language_path
    if I18n.locale == :en
      "/de"
    else
      '/en'
    end
  end

  def switch_language_name
    if I18n.locale == :en
      t('de')
    else
      t('en')
    end

  end
end
