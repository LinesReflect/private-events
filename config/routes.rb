Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  resources :events do
    # put "/events/:id", to: "events#change_availability"
    resources :event_invites
    delete "/event_invites", to: "event_invites#destroy"
  end
  resources :event_attendees
  post "events/:event_id/event_attendees/new", to: "event_attendees#create"
  delete "/event_attendees/:event_id", to: "event_attendees#destroy"
  resources :users, only: [ :show ]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "events#index"
end
