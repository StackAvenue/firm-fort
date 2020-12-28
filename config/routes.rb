Rails.application.routes.draw do
  get 'users/index'
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: "users/registrations",
        invitations: "users/invitations"
      }
  devise_scope :user do
    get '/users/sign_out' => 'users/sessions#destroy'
    get '/users/invitation/pending' => 'users/invitations#pending'
    get '/user/invitation/resend/:id' => 'users/invitations#resend', as: 'user_invitation_resend'
    get 'users/search' => 'users#search'
    get '/users/invitation/pending/search' => "users/invitations#search"
    get '/users/profile', to: 'users#profile'
  end

  resources :users

  root  'home#dashboard'
end
