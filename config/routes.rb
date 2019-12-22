Rails.application.routes.draw do
  root 'public#index'
  get 'show/:permalink', to: 'public#show', as: 'public_show'

  get 'admin', to: 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :admin_users, except: :show do
    member { get :delete }
  end

  resources :subjects do
    member { get :delete }
  end

  resources :pages do
    member { get :delete }
  end

  resources :sections do
    member { get :delete }
  end

  # For details on the DSL available within this file, see
  # http://guides.rubyonrails.org/routing.html
end
