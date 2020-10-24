  Rails.application.routes.draw do

  resources :change_request_mappings
  resources :contact_change_requests
  resources :feduciary_documents
	resources :questionaire_answers
	get 'save_fifty_five_hundred', to: 'questionaire_answers#is_completed_fifty_five_hundred'
	get 'save_plan', to: 'questionaire_answers#is_completed_plan'

	get'plans_new',to: 'questionaire_answers#new'
  post 'plans_create',to: 'questionaire_answers#create_plan'
  get 'plans',to: 'questionaire_answers#index_plan'
  get '5500_new',to: 'questionaire_answers#fifty_five_hundred_new',as: :fifty_five_hundred_new
  post '5500_create',to: 'questionaire_answers#create_fifty_five_hundred'
  get 'plans/:id/edit',to: 'questionaire_answers#edit_plan',as: :edit_plan
  patch 'plans/:id',to: 'questionaire_answers#update_plan',as: :plans_update
  get '5500/:id/edit',to: 'questionaire_answers#edit_5500',as: :edit_fifty_five_hundred
  patch '5500/:id',to: 'questionaire_answers#update_5500',as: :fifty_five_hundred_update
  get '5500',to: 'questionaire_answers#index_fifty_five_hundred',as: :fifty_five_hundred

  resources :question_types
  resources :task_groups
  resources :tasks
	resources :notes
		get 'note/delete_note/:id', to: 'notes#delete_note'
		post 'note/create_note', to: 'notes#create_note'
		post 'note/update_note/:id', to: 'notes#update_note'
		get 'notes/get_note/:id', to: 'notes#get_note'

  resources :documents
	resources :approvals
  resources :roles
  resources :rights
  resources :contact_numbers
  post 'approval',to: 'approvals#send_email'
  get 'address/add',to: 'addresses#add_new_address'
  post 'address/create',to: 'addresses#create_new_address'
  get 'general/',to: 'generals#find_task'
  get 'close_task',to: 'tasks#close_task'
	resources :addresses
  get '/addresses/:id/:address_mapping', to: 'addresses#edit', as: :address_edit

	get '/address/get_address/:id', to: 'addresses#get_address'
	get 'address/add',to: 'addresses#add_new_address'
  post 'address/create',to: 'addresses#create_new_address'

  resources :employees do
    collection do
      get 'bulk_delete', to:  'employees#bulk_delete'
    end
  end
  get 'save_employee', to: 'employees#save_employee'

  # resources :fifty_five_hundreds, only: [:update,:create]
  #   get '5500', to: 'fifty_five_hundreds#index', as: :fifty_5500
  #   get '5500/new', to: 'fifty_five_hundreds#new',as: :fifty_5500_new
  #   get '5500/:id/edit',to: 'fifty_five_hundreds#edit',as: :fifty_5500_edit
  #   delete '5500/:id',to: 'fifty_five_hundreds#destroy',as: :fifty_5500_delete
  #   get '5500/:id',to: 'fifty_five_hundreds#show',as: :fifty_5500_show

  #resources :plans
	resources :contacts
  get 'save_contact', to: 'contacts#is_completed'
  get 'view_requests',to: 'contacts#contact_change_request_index'
	resources :businesses
	get 'save_business', to: 'businesses#is_completed'
	resources :families
	get 'save_family', to: 'families#is_completed'

	resources :principals
	get 'save_principal', to: 'principals#is_completed'
	resources :companies
		get 'save_company', to: 'companies#is_completed'
		post 'company/create_note', to: 'companies#create_note'
		delete 'company/delete_note', to: 'companies#delete_note'
		post 'company', to: 'companies#create_note'
	resources :generals
	get 'save_general', to: 'generals#is_completed'
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
  get 'dashboard/:number',to: 'home#internal_dashboard'
  get 'dashboar',to: 'home#dashboar'
  #get 'dashboard',to: 'dashboard#internal_dashboard'

  post 'import_file' => 'employees#import_store'

end
