Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
      
  root to: redirect('/warning')
  
  mount ActionCable.server => '/cable'
  
  get '/warning', to: 'warning#index'
  get 'home', to: 'home#index'
  
  namespace :db do
    get '', action: :index
    
    resources :albums do
      collection do
        get 'search'
      end
      resources :comments, controller: 'albums/comments'
    end
  end
  
  get 'user', to: 'users#current', as: 'current_user_page'
  resources :users, only: [:index, :show]
  
  namespace :utilities do
    post 'nsfw'
  end
end
