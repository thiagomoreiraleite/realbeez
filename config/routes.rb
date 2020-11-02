Rails.application.routes.draw do

  # Pages
  root to: 'pages#home'
  get '/tarifs', to: 'pages#details_tarifs', as: :details
  get '/mentions_legales', to: 'pages#mentions_legales', as: :mentions_legales
  get '/nous_decouvrir', to: 'pages#nous_decouvrir', as: :nous_decouvrir
  get '/fiches_pratiques', to: 'pages#fiches_pratiques', as: :fiches_pratiques
  get '/statut_auto_entrepreneur', to: 'pages#statut_auto_entrepreneur', as: :statut_auto_entrepreneur
  get '/charges_deductibles', to: 'pages#charges_deductibles', as: :charges_deductibles
  get '/reponse_contactez_nous', to: 'pages#reponse_contactez_nous', as: :reponse_contactez_nous
  get '/investissement_locatif', to: 'pages#investissement_locatif', as: :investissement_locatif
  get '/recommandation', to: 'pages#recommandation', as: :recommandation
  get '/contrat_template', to: 'pages#contrat_template', as: :contrat_template
  get '/outils', to: 'pages#outils', as: :outils
  get '/documents_contrat_bail', to: 'pages#documents_contrat_bail', as: :documents_contrat_bail
  resources :pages, only: [:new, :create]

  # Parrains
  resources :parrains, only: [:new, :create]
  get '/confirmation_parrainage', to: 'parrains#confirmation_parrainage', as: :confirmation_parrainage

  # Users
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  resources :profiles, only: [:index, :show]
  get '/all_users', to: 'profiles#profile_all_users', as: :profile_all_users

  # Annonces
  resources :annonces do
    # Candidatures
    resources :candidatures, only: [:new, :create]
    # Mandats
    resources :mandats, only: [:new, :create]
    # Locataires candidataure
    resources :locataire_candidatures, only:[:new, :create]
  end
  get '/mes_annonces', to: 'annonces#mes_annonces', as: :mes_annonces
  get '/annonces_all', to: 'annonces#annonces_all', as: :annonces_all
  get '/biens_a_gerer', to: 'annonces#biens_a_gerer', as: :biens_a_gerer
  get '/annonces/:id/checkout_agent', to: 'annonces#checkout_agent', as: :checkout_agent
  get '/annonces/:id/checkout_proprio', to: 'annonces#checkout_proprio', as: :checkout_proprio
  resources :mandats, only: [:show, :edit, :update]

  # Locataire candidature
  resources :locataire_candidatures, only:[:edit, :update, :destroy, :show] do
    # Contrat de bail
    resources :contrats, only: [:new, :create]
  end
  post '/locataires/:id/accept_locataire', to: 'locataire_candidatures#accept_locataire', as: :accept_locataire
  post '/locataires/:id/reject_locataire', to: 'locataire_candidatures#reject_locataire', as: :reject_locataire
  get '/locataires_locataire', to: 'locataire_candidatures#locataires_locataire', as: :locataires_locataire
  get '/locataires_proprio', to: 'locataire_candidatures#locataires_proprio', as: :locataires_proprio
  get '/locataires_agent', to: 'locataire_candidatures#locataires_agent', as: :locataires_agent
  get '/locataires_all', to: 'locataire_candidatures#locataires_all', as: :locataires_all
  get '/confirmation_locataire_candidature', to: 'locataire_candidatures#confirmation_locataire_candidature', as: :confirmation_locataire_candidature
  get '/confirmation_depot_dossier', to: 'locataire_candidatures#confirmation_depot_dossier', as: :confirmation_depot_dossier
  # Contrat de bail
  resources :contrats, only: [:show, :edit, :update]

  # Locataires
  resources :locataires, only:[:new, :create, :edit, :update, :destroy, :show, :index]
  # post '/locataires/:id/accept_locataire', to: 'locataires#accept_locataire', as: :accept_locataire
  # post '/locataires/:id/reject_locataire', to: 'locataires#reject_locataire', as: :reject_locataire
  # get '/locataires_locataire', to: 'locataires#locataires_locataire', as: :locataires_locataire
  # get '/locataires_proprio', to: 'locataires#locataires_proprio', as: :locataires_proprio
  # get '/locataires_agent', to: 'locataires#locataires_agent', as: :locataires_agent
  # get '/locataires_all', to: 'locataires#locataires_all', as: :locataires_all

  # Meeting
  resources :meetings
  get '/meetings_proprio_view', to: 'meetings#meetings_proprio_view', as: :meetings_proprio_view

  # Candidatures
  resources :candidatures, only: [:edit, :update, :index, :create, :destroy]
  post '/candidatures/:id/accept_candidature', to: 'candidatures#accept_candidature', as: :accept_candidature
  post '/candidatures/:id/reject_candidature', to: 'candidatures#reject_candidature', as: :reject_candidature
  get '/candidatures/proprio', to: 'candidatures#candidature_proprio', as: :candidature_proprio
  get '/candidatures/agent', to: 'candidatures#candidature_agent', as: :candidature_agent
  get '/candidatures/all', to: 'candidatures#candidature_all', as: :candidature_all
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

  # Notifications
  resources :notifications, only: [:new, :create, :index, :destroy]
  post '/notifications/mark_as_read', to: 'notifications#mark_as_read', as: :mark_as_read
  get '/notifications/all_notifications', to: 'notifications#all_notifications', as: :all_notifications

  # , defaults: { format: :json }

  # Reviews
  resources :agents do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:index]

  # Conversations and messages
  resources :conversations, only: [:index, :show, :new, :create, :destroy]  do
    resources :messages, only: [:create]
  end

  # Contact
  resources :contacts, only: [:new, :create]
  get '/confirmation_contact', to: 'contacts#confirmation_contact', as: :confirmation_contact

  # Blog
  resources :blogs, only:[:new, :create, :edit, :update, :destroy, :show, :index]

  # get '/404', to: "errors#not_found"
  # get '/422', to: "errors#unacceptable"
  # get '/500', to: "errors#internal_error"

end
