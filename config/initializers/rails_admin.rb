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
      # configure :translations, :globalize_tabs
      field :question, :ck_editor
      field :answer, :ck_editor
    end
    list do
      field :en_question do
        label 'Question in English'
        pretty_value do
          value.html_safe if value.present?
        end
      end
      field :en_answer do
        label 'Answer in English'
        pretty_value do
          value.html_safe if value.present?
        end
      end

      field :de_question do
        label 'Question in German'
        pretty_value do
          value.html_safe if value.present?
        end
      end

      field :de_answer do
        label 'Answer in German'
        pretty_value do
          value.html_safe if value.present?
        end
      end
      field :created_at
      field :updated_at
    end
    show do
      field :en_question do
        label 'Question in English'
        pretty_value do
          value.html_safe if value.present?
        end
      end
      field :en_answer do
        label 'Answer in English'
        pretty_value do
          value.html_safe if value.present?
        end
      end

      field :de_question do
        label 'Question in German'
        pretty_value do
          value.html_safe if value.present?
        end
      end

      field :de_answer do
        label 'Answer in German'
        pretty_value do
          value.html_safe if value.present?
        end
      end
      field :created_at
      field :updated_at
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
          value.html_safe if value.present?
        end
      end
      field :answer do
        pretty_value do
          value.html_safe if value.present?
        end
      end
      field :created_at
      field :updated_at
      field :locale
    end
    list do
      field :question do
        pretty_value do
          value.html_safe if value.present?
        end
      end
      field :answer do
        pretty_value do
          value.html_safe if value.present?
        end
      end
      field :created_at
      field :updated_at
      field :locale
    end
  end
  config.included_models = ['Article', 'Article::Translation']
  # I18n.available_locales = [:en, :de]
end
