Rails.application.routes.draw do
  resources :meetings
  # Pages
  root to: 'pages#home'

  # Users
  devise_for :users
  resources :profiles, only: [:index, :show]

  # Annonces
  resources :annonces do
    # Candidatures
    resources :candidatures, only: [:new, :create]
  end
  get '/mes_annonces', to: 'annonces#mes_annonces', as: :mes_annonces

  # Candidatures
  resources :candidatures, only: [:edit, :update, :index, :create]
  post '/candidatures/:id/accept_candidature', to: 'candidatures#accept_candidature', as: :accept_candidature
  post '/candidatures/:id/reject_candidature', to: 'candidatures#reject_candidature', as: :reject_candidature
  get '/candidatures/proprio', to: 'candidatures#candidature_proprio', as: :candidature_proprio
  get '/candidatures/agent', to: 'candidatures#candidature_agent', as: :candidature_agent

  # Friends
  get '/my_friends', to: 'profiles#my_friends', as: :my_friends
  post '/profiles/:id/add', to: 'profiles#add_friend', as: :add_friend
  post '/profiles/:id/accept', to: 'profiles#accept_friend', as: :accept_friend
  post '/profiles/:id/decline', to: 'profiles#decline_friend', as: :decline_friend

  # Availabilities
  resources :availabilities, only: [:new, :create, :edit, :update, :destroy]

end
