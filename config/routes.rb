Rails.application.routes.draw do

  resources :contact_numbers
  resources :addresses
  resources :employees
  resources :fifty_five_hundreds
  resources :plans
  resources :contacts
  resources :businesses
  resources :buisenesses
  resources :families
  resources :principals
  resources :companies
  resources :generals
  devise_for :users

  authenticate :user do
    mount PgHero::Engine, at: '/pghero'
    mount Sidekiq::Web,   at: '/sidekiq'
  end

  resources :calendar_dates, only: %i[index show]
  resources :scheduled_jobs
  resources :users
  resources :my_active_task
  resources :distribution
  resources :data_collection
  root to: 'home#index'
end
