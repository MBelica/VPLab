Rails.application.routes.draw do

  get 'home', to: 'home#index', as: :home
  get 'dashboard', to: 'home#dashboard', as: :dashboard

  get 'experiments', to: 'experiments#index', as: :experiments
  get 'experiments/edit/:key', to: 'experiments#edit', as: :experiments_edit
  get 'experiments/new', to: 'experiments#new', as: :experiments_new

  get 'admin', to: 'admin#index', as: :admin
  get 'admin/users', to: 'admin#users', as: :admin_users
  get 'admin/users/new', to: 'admin#new', as: :admin_users_new
  get 'admin/users/edit/:key', to: 'admin#edit', as: :admin_users_edit
  post 'admin/users/edit/:key', to: 'admin#update', as: :admin_users_update

  devise_for :users, path: '',
             controllers: { registrations: 'registrations', sessions: 'sessions', passwords: 'passwords', confirmations: 'confirmations', unlocks: 'unlocks' },
             path_names: { sign_in: 'login', sign_out: 'logout', password: 'password', confirmation: 'confirmation', unlock: 'unlock', registration: 'user', sign_up: 'signup', edit: 'profile' }

  devise_scope :user do
    authenticated :user do
      root to: 'home#dashboard'
      get 'user/', to: 'registrations#edit'
    end
    unauthenticated :user do
      root to: 'home#index'
      get 'user/', to: 'registrations#new'
    end

    get 'signup', to: 'registrations#new', as: :user_signup
    get 'user/login', to: 'sessions#new', as: :user_login
    get 'user/unlock', to: 'unlocks#new', as: :user_acc_unlock
    get 'user/profile', to: 'registrations#edit', as: :user_edit
    get 'password', to: 'passwords#new', as: :reset_password
    get 'password/new', to: 'passwords#new', as: :main_reset_password
    get 'password/edit', to: 'passwords#edit', as: :update_password
    get 'confirmation', to: 'confirmations#new', as: :user_acc_confirmation
  end

end
