Rails.application.routes.draw do
  get 'users/index'
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: "users/registrations",
        invitations: "users/invitations",
        omniauth_callbacks: 'users/omniauth_callbacks'
      }
  devise_scope :user do
    get '/users/sign_out', to: 'users/sessions#destroy'
    get '/users/invitation/pending', to: 'users/invitations#pending'
    get '/user/invitation/resend/:id', to: 'users/invitations#resend', as: 'user_invitation_resend'
    get 'users/search', to: 'users#search'
    get '/users/invitation/pending/search', to: "users/invitations#search"
    get '/users/profile/:id', to: 'users#profile', as: 'users_profile'
  end

  resources :users

  root  'home#dashboard'
end
