Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :questions, param: :slug

  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               password: 'forgot',
               confirmation: 'confirm',
               unlock: 'unblock',
               sign_up: 'register',
               sign_out: 'logout'
             }
end
