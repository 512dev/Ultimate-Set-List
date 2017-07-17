Rails.application.routes.draw do
  # get 'pages/home'

  # get 'pages/about'

    

  devise_for :users,
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'pages/home'
end
