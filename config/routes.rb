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
    get '/search' => 'users#search'
  end

  resources :users

  root  'home#dashboard'
end
