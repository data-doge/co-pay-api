Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :memberships, only: [] do
    collection do
      get :my_memberships
    end
  end

  resources :groups, only: [:show]
end
