Rails.application.routes.draw do

  get 'users/show'

  devise_for :users

  resources :users

  resources :wikis
  get 'welcome/index'

  get 'welcome/about'


  root to: 'welcome#index'

end
