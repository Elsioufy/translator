RailsAdmin.config do |config|
  config.authorize_with do
    authenticate_or_request_with_http_basic('Please login to Phrase App') do |username, password|
      username == 'admin' && password == 'phraseAppDE2019'
    end
  end
  config.main_app_name = ["Phraseapp", "BackOffice"]
  config.parent_controller = '::RailsAdminLocaleController'
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
  config.model Article do
    edit do
      configure :translations, :globalize_tabs
    end
  end

  config.model 'Article::Translation' do
    edit do
      field :question, :ck_editor
      field :answer, :ck_editor
    end
    show do
      field :question do
        pretty_value do
          value.html_safe
        end
      end
      field :answer do
        pretty_value do
          value.html_safe
        end
      end
    end
    list do
      field :question do
        pretty_value do
          value.html_safe
        end
      end
      field :answer do
        pretty_value do
          value.html_safe
        end
      end
    end
    include_fields :locale, :question, :answer
  end
  config.included_models = ['Article','Article::Translation']
  I18n.available_locales = [:en, :de]
end
