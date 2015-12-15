Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  namespace :admin do
    resources :users, only: [:new, :index, :create, :destroy]
    resources :sponsor_categories
    resources :sponsors
    resources :page_contents
    resources :mail_contents do
      get 'send_schedule' => 'mail_contents#send_schedule', on: :member
      get 'configure' => 'mail_contents#configure', on: :collection
      post 'save_settings' => 'mail_contents#save_settings', on: :collection
    end
    resources :special_guests
    resources :sections
    resources :schedule_intervals do
      resources :schedule_sub_intervals do
        resources :schedule_events
      end
    end
    get 'placement' => 'placement#index'
    post 'placement' => 'placement#update'
    resources :workshops do
      put 'approve' => 'workshops#approve', on: :member
      put 'deny' => 'workshops#deny', on: :member
      get 'excel' => 'workshops#excel', on: :collection
      resources :comments
    end
    resources :listener_requests, only: [:index] do
      get 'excel' => 'listener_requests#excel', :on => :collection
    end
  end

  scope '(:locale)', :locale => /en|ru/ do

    devise_for :users, :controllers => {:registrations => 'registrations'}
    resources :workshops do
      resources :comments
      get 'info' => 'workshops#info', :on => :member
    end
    resources :users, only: [:index, :show]

    root 'index#index'
    get 'profile' => 'users#profile', as: 'profile'
    get 'contacts' => 'index#contacts'
    get 'org_committee' => 'index#org_committee'
    get 'why_kfu' => 'index#why_kfu'
    get 'information_letter' => 'index#information_letter'
    get 'cultural_program' => 'index#cultural_program'
    get 'accommodation' => 'index#accommodation'
    get 'regulations' => 'index#regulations'

    resources :listener_requests, only: [:index, :new, :create] do
      get 'success' => 'listener_requests#success', :on => :member
    end

    resources :special_guests, only: [:show] do
      get 'speakers' => 'special_guests#speakers', :on => :collection
      get 'guests' => 'special_guests#guests', :on => :collection
    end

    resources :sections, only: [:show]

    # resources :articles

  end


end
