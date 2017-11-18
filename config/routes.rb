Rails.application.routes.draw do
  root to: redirect('/warning')
  mount ActionCable.server => '/cable'

  # Devise routing
  devise_for :users, skip: [:registrations], controllers: {
    sessions: 'users/sessions',
    # registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get 'users/cancel', to: 'users/registrations#cancel', as: :cancel_user_registration
    get 'users/sign_up', to: 'users/registrations#new', as: :new_user_registration
    put 'users', to: 'users/registrations#update', as: :user_registration
    patch 'users', to: 'users/registrations#update'
    post 'users', to: 'users/registrations#create'
    delete 'users', to: 'users/registrations#destroy'
  end

  # User profile
  scope module: :users do
    resources :profiles, only: [:show, :index, :update] do
      get 'my_list', to: 'my_list#index'
    end
  end

  namespace :db do
    root action: 'index', as: ''

    resources :recent_activities, only: :index

    resources :albums do
      collection do
        get 'search'
      end
      resources :tags, only: [:create, :destroy], controller: 'albums/tags'
      resources :discs, except: [:index, :show], shallow: true do
        resources :songs, shallow: true
      end
      resource :release
      resources :versions, controller: 'album_versions'
      resources :comments, controller: 'albums/comments'
    end

    resources :songs do
      resources :versions, controller: 'song_versions'
      resources :comments, controller: 'songs/comments'
      resources :staffs, controller: 'staffs', shallow: true
    end

    resources :song_versions, only: [] do
      resources :staffs, controller: 'song_versions/staffs'
    end

    resources :album_versions, only: [] do
      resources :discs, only: :destroy, controller: 'album_versions/discs'
    end

    resources :staffs, only: [] do
      resources :versions, controller: 'staff_versions'
    end

    resources :people do
      resources :versions, controller: 'person_versions'
      resources :comments, controller: 'people/comments'
    end

    resources :tags do
      collection do
        get 'search'
      end
    end

    resources :companies do
      resources :versions, controller: 'company_versions'
    end

    namespace :search do
      get '', action: :index
    end
  end

  namespace :search do
    get '', action: :index
    get 'live'
  end

  namespace :utilities do
    post 'nsfw'
  end

  scope module: :static_pages do
    get 'home'
    get 'warning'
  end

  namespace :admin do
    root to: 'dashboard#statistics'

    namespace :dashboard do
      root action: 'statistics'
      get 'statistics'
    end

    scope module: :db do
      get 'albums_list', to: 'albums#index'
      get 'publishers_list', to: 'companies#index'
      get 'staffs_list', to: 'people#index'
      get 'tags_list', to: 'tags#index'
    end

    scope module: :ec do
      get 'shops_list', to: 'shops_management#index'
    end

    get 'users_list', to: 'users_management#index'
  end

  namespace :feature do
    resources :comments
    resources :ratings
  end

  scope module: :shop do
    resource :shop do
      resources :products do
        delete 'destroy_multiple', on: :collection
      end
    end

    resources :products, only: [] do
      resources :images, controller: 'products/images' do
        delete 'destroy_multiple', on: :collection
      end
      resources :colors, controller: 'products/colors'
      resource :discount, controller: 'products/discounts'
    end
  end

  namespace :ec do
    root to: 'home#index', as: ''
    resources :products
    resources :categories
    resources :shops do
      resources :products, controller: 'shop/products'
    end
  end
end
