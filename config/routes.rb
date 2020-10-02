  Rails.application.routes.draw do

  resources :task_groups
  resources :tasks
  resources :notes
  resources :documents
	resources :approvals
  resources :roles
  resources :rights
  resources :contact_numbers
  post 'approval',to: 'approvals#send_email'
  get 'contact_number/add',to: 'contact_numbers#add_new_contact_number'
  post 'contact_number/create',to: 'contact_numbers#create_new_contact_number'
  get 'address/add',to: 'addresses#add_new_address'
  post 'address/create',to: 'addresses#create_new_address'
  get 'general/',to: 'generals#find_task'
  get 'close_task',to: 'tasks#close_task'
	resources :addresses
		get '/address/get_ address/:id', to: 'addresses#get_address'

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
    get '5500/:id',to: 'fifty_five_hundreds#show',as: :fifty_5500_show

  resources :plans
  resources :contacts
  resources :businesses
  resources :buisenesses
  resources :families
  resources :principals
	resources :companies
		post 'company/create_note', to: 'companies#create_note'
		post 'company', to: 'companies#create_note'
  resources :generals
  devise_for :users
  get 'users/sign_in',to: 'user/sessions#destroy'

  authenticate :user do
    mount PgHero::Engine, at: '/pghero'
    mount Sidekiq::Web,   at: '/sidekiq'
  end

  resources :users
  resources :distribution
  resources :data_collection
  root to: 'home#index'

  post 'import_file' => 'employees#import_store'

end
