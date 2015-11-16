Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => {:registrations => 'registrations'}

  resources :users, :only => [:show]

  root 'index#index'

  get '/contacts' => 'index#contacts'

  resources :listener_requests do
    get 'success' => 'listener_requests#success'
  end

  resources :articles do
  end

  resources :page_contents do
  end

  namespace :admin do
    resources :users do

    end
  end


end
