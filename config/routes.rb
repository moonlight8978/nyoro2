Rails.application.routes.draw do
  devise_for :users
  root to: redirect('/warning')
  
  get '/warning', to: 'warning#index'
  get 'home', to: 'home#index'
  
  namespace :db do
    resources :albums do
      collection do
        get 'search'
      end
    end
  end
  
  get '/sign_in', to: 'users/registrations#edit'
end
