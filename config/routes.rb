Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :controllers => { :registrations => :registrations }

  devise_scope :user do 
    get 'user/:username/profile/edit', to: 'devise/registrations#edit', as: :edit_profile
  end

  root 'welcome#index'
  get 'themes/tags/:tag', to: 'themes#index', as: :tag, :constraints => { :compatible => /[^\/]+/ }
  get 'themes/browsers/:browser', to: 'themes#index', as: :browser, :constraints => { :compatible => /[^\/]+/ }
  get 'themes/compatibles/:compatible', to: 'themes#index', as: :compatible, :constraints => { :compatible => /[^\/]+/ }
  get 'themes/fileincludes/:fileinclude', to: 'themes#index', as: :fileinclude, :constraints => { :compatible => /[^\/]+/ }
  get 'themes/devices/:device', to: 'themes#index', as: :device,  :constraints => { :compatible => /[^\/]+/ }
  get 'categories/:categories', to: 'categories#index', as: :categories,  :constraints => { :compatible => /[^\/]+/ }
  get 'subcategories/:subcategories', to: 'subcategories#index', as: :subcategories,  :constraints => { :compatible => /[^\/]+/ }

  resources :themes do
    resources :comments
    member do 
      get 'like', to: 'themes#upvote'
      get 'dislike', to: 'themes#downvote'
      get 'screenshot', to: 'themes#screenshot', :as => :screenshot
    end
  end
  resources :categories, only: [:index]
  resources :subcategories, only: [:index]
  resources :friendships, only: [:create, :destroy, :new]
  resource :cart, only: [:show]
  resources :order_themes, only: [:create, :update, :destroy]

  get 'user/:id', to: 'dashboard#show', as: :user_dashboard
  resources :dashboard, only: [:show, :create] do
    collection do
      get 'profile/:id', to: 'dashboard#profile', as: :profile
      get 'following/:id', to: 'dashboard#following', as: :following
      get 'follower/:id', to: 'dashboard#follower', as: :follower
      get 'portofolio/:id', to: 'dashboard#portofolio', as: :portofolio
      get 'favorite/:id', to: 'dashboard#favorite', as: :favorite
      get 'follow_feed/:id', to: 'dashboard#follow_feed', as: :follow_feed
    end
  end
end
