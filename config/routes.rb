Rails.application.routes.draw do
  resources :users
  get 'user/index'

  get 'user/new'

  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
