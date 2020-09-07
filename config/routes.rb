Rails.application.routes.draw do
  get 'page/dashboard'
  get 'pages/dashboard'
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  
  root  'page#dashboard'
end
