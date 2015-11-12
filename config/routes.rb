Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => {:registrations => 'registrations'}
  root 'index#index'

  resources :articles do

  end


end
