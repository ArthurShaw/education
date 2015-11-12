Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => 'registrations'}
  root 'index#index'

  resources :articles do

  end


end
