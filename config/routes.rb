Rails.application.routes.draw do

  devise_for :users

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

  get 'user/:id', to: 'dashboard#show', as: :user_dashboard
  resources :themes do
  	resources :comments
  end
  resources :categories, only: [:index]

  resources :dashboard, only: [:show, :create] do
    collection do 
      get 'profile/:id', to: 'dashboard#profile', as: :profile
    end
  end
 

end
