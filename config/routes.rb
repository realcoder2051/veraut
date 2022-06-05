  Rails.application.routes.draw do

  devise_for :users
  # get 'users/sign_in',to: 'user/sessions#destroy'
  # # get 'users/change_password',to: 'users#change_password'
  # # put 'users/update_password',to: 'users#update_password'

  # authenticate :user do
  #   mount PgHero::Engine, at: '/pghero'
  #   mount Sidekiq::Web,   at: '/sidekiq'
  # end

  resources :users
  post 'users/create_users', to: 'users#create_users', as: :create_users
  
  resources :secure_files, only: %i[index] do
    collection do
      post :upload_csv
      get :csv_data
    end
  end

  root :to => "users#index"
end
