Rails.application.routes.draw do

  resources :roles
  resources :contact_numbers
  resources :addresses
  resources :employees do
    collection do
      get 'bulk_delete', to:  'employees#bulk_delete'
    end
  end
  get 'save_employee', to: 'employees#save_employee'

  resources :fifty_five_hundreds, only: [:update,:create]

    get '5500', to: 'fifty_five_hundreds#index', as: :fifty_5500
    get '5500/new', to: 'fifty_five_hundreds#new',as: :fifty_5500_new
    get '5500/:id/edit',to: 'fifty_five_hundreds#edit',as: :fifty_5500_edit
    delete '5500/:id',to: 'fifty_five_hundreds#destroy',as: :fifty_5500_delete


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

  post 'import_file' => 'employees#import_store'

end
