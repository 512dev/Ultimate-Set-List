Rails.application.routes.draw do
  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :setlists do
    resources :tracks, only: [:index, :create]
    resources :comments, except: [:index, :show]
    resources :favorite, except: [:show]
  end
  post "/addTrack", to: 'set_list_track#create'
  root 'pages#home'
end
