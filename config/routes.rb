Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'
  resources :articles, only: [:show, :index]
  root :to => "articles#index"
end
