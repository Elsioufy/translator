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
      field :title, :ck_editor
      field :body, :ck_editor
    end
    list do
      field :title do
        pretty_value do
          value.html_safe
        end
      end
      field :body do
        pretty_value do
          value.html_safe
        end
      end
    end
    show do
      field :title do
        pretty_value do
          value.html_safe
        end
      end
      field :body do
        pretty_value do
          value.html_safe
        end
      end
    end
  end
end
