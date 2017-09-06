Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
      
  root to: redirect('/warning')
  
  mount ActionCable.server => '/cable'
  
  get '/warning', to: 'warning#index'
  get 'home', to: 'home#index'
  
  namespace :db do
    resources :albums do
      collection do
        get 'search'
      end
      resources :comments, controller: 'albums/comments'
    end
  end
  
  resource :user, only: :show
  resources :users
end
