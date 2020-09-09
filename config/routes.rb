Rails.application.routes.draw do

  devise_for :users

  authenticate :user do
    mount PgHero::Engine, at: '/pghero'
    mount Sidekiq::Web,   at: '/sidekiq'
  end

  resources :calendar_dates, only: %i[index show]
  resources :scheduled_jobs
  resources :users


  root to: 'home#index'

end