Rails.application.routes.draw do

  devise_for :users
  root 'welcome#index'
  get 'themes/tags/:tag', to: 'themes#index', as: :tag, :constraints => { :compatible => /[^\/]+/ }
  get 'themes/browsers/:browser', to: 'themes#index', as: :browser, :constraints => { :compatible => /[^\/]+/ }
  get 'themes/compatibles/:compatible', to: 'themes#index', as: :compatible, :constraints => { :compatible => /[^\/]+/ }
  get 'themes/fileincludes/:fileinclude', to: 'themes#index', as: :fileinclude, :constraints => { :compatible => /[^\/]+/ }
  get 'themes/devices/:device', to: 'themes#index', as: :device,  :constraints => { :compatible => /[^\/]+/ }
  get 'categories/:categories', to: 'categories#index', as: :categories,  :constraints => { :compatible => /[^\/]+/ }
  # get 'categories/:wordpress', to: 'categories#index', as: :wordpress,  :constraints => { :compatible => /[^\/]+/ }
  resources :themes do
  	resources :comments
  end
  resources :categories, only: [:index]
 

end
