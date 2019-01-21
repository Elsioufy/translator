RailsAdmin.config do |config|
  config.authorize_with do
    authenticate_or_request_with_http_basic('Please login to Phrase App') do |username, password|
      username == 'admin' && password == 'phraseAppDE2019'
    end
  end
  config.excluded_models = [Ckeditor::Asset, Ckeditor::Picture, Ckeditor::AttachmentFile]
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
      field :question, :ck_editor
      field :answer, :ck_editor
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
  end
end
