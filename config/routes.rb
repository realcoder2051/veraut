  Rails.application.routes.draw do

  # devise_for :users
  # get 'users/sign_in',to: 'user/sessions#destroy'
  # get 'users/change_password',to: 'users#change_password'
  # put 'users/update_password',to: 'users#update_password'

  # authenticate :user do
  #   mount PgHero::Engine, at: '/pghero'
  #   mount Sidekiq::Web,   at: '/sidekiq'
  # end

  resources :users
  root :to => "users#index"
end
