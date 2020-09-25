Rails.application.routes.draw do
  get 'users/index'
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: "users/registrations"
      }
  devise_scope :user do
    get '/users/sign_out' => 'users/sessions#destroy'
  end

  resources :users

  root  'home#dashboard'
end
