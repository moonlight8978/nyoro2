Rails.application.routes.draw do
  root to: redirect('/warning')
  
  mount ActionCable.server => '/cable'
  
  get 'home', to: 'home#index'
  get '/warning', to: 'warning#index'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: [:show, :index]
  get 'user', to: 'users#current', as: 'current_user_page'
  put 'user', to: 'users#update'
  
  
  namespace :db do
    get '', action: :index
    
    resources :albums do
      collection do
        get 'search'
      end
      resources :versions, controller: 'album_versions'
      resources :comments, controller: 'albums/comments'
    end
  end
  
  namespace :utilities do
    post 'nsfw'
  end
end
