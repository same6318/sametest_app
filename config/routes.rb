Rails.application.routes.draw do
  resources :blogs
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  devise_scope :user do
    get 'admin/sign_in', to: 'admin/sessions#new', as: :new_admin_session
    post 'admin/sign_in', to: 'admin/sessions#create', as: :admin_session
    delete 'admin/sign_out', to: 'admin/sessions#destroy', as: :destroy_admin_session
  end
  # devise_scope :admins, controllers: {
  #   # ↓ローカルに追加されたコントローラーを参照する(コントローラー名: "コントローラーの参照先")
  #   users: "admins/user"
  #   registrations: "admins/registrations",
  #   sessions: "admins/sessions",
  #   passwords: "admins/passwords",
  #   confirmations: "admins/confirmations"
  # }


  # devise_scope :admin do
  #   get 'admin/sign_in', to: 'admin/sessions#new', as: :new_admin_session
  # end

  resources :users
  # namespace :admin do
  #   resources :users
  # end

end
