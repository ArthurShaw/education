Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  scope "(:locale)", :locale => /en|ru/ do

    devise_for :users, :controllers => {:registrations => 'registrations'}
    resources :workshops
    resources :users, :only => [:show]

    root 'index#index'
    get 'profile' => 'users#profile', as: 'profile'
    get '/contacts' => 'index#contacts'

    resources :listener_requests do
      get 'success' => 'listener_requests#success'
    end

    resources :articles do
    end

    namespace :admin do
      resources :users do
      end
      resources :sponsor_categories do
      end
      resources :sponsors do
      end
      resources :page_contents do
      end
      resources :special_guests do
      end
      resources :sections do
      end
      resources :listener_requests do
        get 'excel' => 'listener_requests#excel', on: :collection
      end
    end
  end


end
