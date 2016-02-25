Rails.application.routes.draw do

  root 'welcome#index'
  get 'themes/tags/:tag', to: 'themes#index', as: :tag
  resources :themes

end
