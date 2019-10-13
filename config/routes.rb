Rails.application.routes.draw do
  resources :meetings
  # Pages
  root to: 'pages#home'
  get '/tarifs', to: 'pages#details_tarifs', as: :details

  # Users
  devise_for :users
  resources :profiles, only: [:index, :show]
  get '/all_users', to: 'profiles#profile_all_users', as: :profile_all_users

  # Annonces
  resources :annonces do
    # Candidatures
    resources :candidatures, only: [:new, :create]
  end
  get '/mes_annonces', to: 'annonces#mes_annonces', as: :mes_annonces
  get '/biens_a_gerer', to: 'annonces#biens_a_gerer', as: :biens_a_gerer
  get '/annonces/:id/checkout_agent', to: 'annonces#checkout_agent', as: :checkout_agent
  get '/annonces/:id/checkout_proprio', to: 'annonces#checkout_proprio', as: :checkout_proprio

  # Candidatures
  resources :candidatures, only: [:edit, :update, :index, :create, :destroy]
  post '/candidatures/:id/accept_candidature', to: 'candidatures#accept_candidature', as: :accept_candidature
  post '/candidatures/:id/reject_candidature', to: 'candidatures#reject_candidature', as: :reject_candidature
  get '/candidatures/proprio', to: 'candidatures#candidature_proprio', as: :candidature_proprio
  get '/candidatures/agent', to: 'candidatures#candidature_agent', as: :candidature_agent
  get '/candidatures/:id/show_proprio', to: 'candidatures#show_proprio', as: :show_proprio
  get '/candidatures/:id/show_agent', to: 'candidatures#show_agent', as: :show_agent

  # Friends
  get '/my_friends', to: 'profiles#my_friends', as: :my_friends
  post '/profiles/:id/add', to: 'profiles#add_friend', as: :add_friend
  post '/profiles/:id/accept', to: 'profiles#accept_friend', as: :accept_friend
  post '/profiles/:id/decline', to: 'profiles#decline_friend', as: :decline_friend

  # Availabilities
  resources :availabilities, only: [:new, :create, :edit, :update, :destroy]
  get '/availabilities/book_dispo', to: 'availabilities#book_dispo', as: :book_dispo

  # Devenir_agent
  resources :agents, only: [:new, :create, :edit, :update, :destroy, :show, :index]
  post '/agents/:id/accept', to: 'agents#accept_agent', as: :accept_agent
  post '/agents/:id/decline', to: 'agents#decline_agent', as: :decline_agent

  # Orders
  resources :orders, only: [:create] do
    # Payments
    resources :payments, only: :new
  end
  resources :orders, only: [:index, :destroy, :show]

  # Stripe Webhook
  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
