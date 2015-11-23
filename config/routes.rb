Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  scope '(:locale)', :locale => /en|ru/ do

    devise_for :users, :controllers => {:registrations => 'registrations'}
    resources :workshops
    resources :users, only: [:show]

    root 'index#index'
    get 'profile' => 'users#profile', as: 'profile'
    get '/contacts' => 'index#contacts'

    resources :listener_requests, only: [:new, :create] do
      get 'success' => 'listener_requests#success'
    end

    resources :articles

    namespace :admin do
      resources :users, only: [:new, :index, :create, :destroy]
      resources :sponsor_categories
      resources :sponsors
      resources :page_contents
      resources :special_guests
      resources :sections
      resources :listener_requests, only: [:index] do
        get 'excel' => 'listener_requests#excel', on: :collection
      end
    end
  end


end
