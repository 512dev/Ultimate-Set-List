Rails.application.routes.draw do
  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :setlists do
    get "/generate_playlist", to: 'setlists#generate_playlist'
    resources :tracks, only: [:index, :create, :destroy]
    resources :comments, except: [:index, :show]
    resources :favorite, except: [:show]
    resources :venue, only: [:index, :show, :create]
  end
  post "/addTrack", to: 'set_list_track#create'
  root 'pages#home'
end
