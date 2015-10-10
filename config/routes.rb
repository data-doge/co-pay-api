Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :memberships, only: [:index] do
    collection do
      get :my_memberships
    end
  end

  resources :groups, only: [:show]

  resources :purchases, only: [:index, :create]
end
