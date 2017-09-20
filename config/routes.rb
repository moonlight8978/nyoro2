Rails.application.routes.draw do
  root to: redirect('/warning')
  mount ActionCable.server => '/cable'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: [:show, :index]
  get 'user', to: 'users#current', as: 'current_user_page'
  put 'user', to: 'users#update'
  
  
  namespace :db do
    root action: 'index', as: ''
    
    resources :albums do
      collection do
        get 'search'
      end
      resources :discs, except: [:index, :show], shallow: true do
        resources :songs, shallow: true
      end
      
      resources :versions, controller: 'album_versions'
      resources :comments, controller: 'albums/comments'
    end
    
    resources :songs do
      resources :versions, controller: 'song_versions'
      resources :comments, controller: 'songs/comments'
    end
    
    resources :people do
      
    end
  end
  
  namespace :utilities do
    post 'nsfw'
  end
  
  scope module: :static_pages do
    get 'home'
    get 'warning'
  end
end
