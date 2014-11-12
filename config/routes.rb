require 'sidekiq/web'

Rails.application.routes.draw do

  resources :photos
  resources :users, :only => [:new, :create, :index]
  resources :logins, :only => [:new, :create, :destroy]
  resources :problems, :only => [:new, :show, :index, :create] do
    member do
      put 'solved'
    end
    resources :notes, :only => [:create]
  end

  mount Sidekiq::Web => '/sidekiq'
  root 'problems#index'
  delete 'logout' => 'logins#destroy'

end
