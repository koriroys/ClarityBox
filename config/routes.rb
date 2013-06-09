  ClarityBox::Application.routes.draw do



# -- Routes for Homepage

root to: 'Headquarters#index'

	get '/', :controller => 'Headquarters', :action => 'index', :as => 'index'
	get '/story', :controller => 'Headquarters', :action => 'story', :as => 'story'
	get '/philosophy', :controller => 'Headquarters', :action => 'philosophy', :as => 'philosophy'


  # get '/about/version1', :controller => 'Pages', :action => 'version1', :as => 'version1'
  # get '/about/version2', :controller => 'Pages', :action => 'version2', :as => 'version1'
  # get '/about/version3', :controller => 'Pages', :action => 'version3', :as => 'version1'


#------------------------------



  # Routes for Signin for Headquarters

    get '/hq/signin' => 'SessionsHeadquarters#new', as: 'new_session_hq'
    post '/hq/signin' => 'SessionsHeadquarters#create', as: 'sessions_hq'
    delete '/hq/signin' => 'SessionsHeadquarters#destroy', as: 'session_hq'



#------------------------------

# -- Routes for Work_requests


#CREATE
  # Form for a new work request in the Headquarters index
  # get '/work_requests/new' => 'WorkRequests#new', as: :new_work_request
  post '/work_requests' => 'WorkRequests#create'

#READ
  get '/work_requests' => 'WorkRequests#index', as: :work_requests

#THANKS

  get '/thanks' => 'WorkRequests#thanks', as: :work_request_thanks

#------------------------------


# -- Routes for Blog



#CREATE

  get '/blog/new' => 'Posts#new', as: :new_post
  post '/blog' => 'Posts#create'


#READ

  get '/blog' => 'Posts#index', as: :posts
  get '/blog/:id' => 'Posts#show', as: :post

#UPDATE

  get '/blog/:id/edit' => 'Posts#edit', as: :edit_post
put '/blog/:id' => 'Posts#update'


#DELETE

  delete '/blog/:id' => 'Posts#destroy'




#------------------------------






# Routes for App home page


      get '/app', :controller => 'App', :action => 'index', :as => 'app_home'


#------------------------------

  # Routes for Signin for App

    get '/app/signin' => 'sessions#new', as: 'new_session'
    post '/sessions' => 'sessions#create', as: 'sessions'
    delete '/sessions' => 'sessions#destroy', as: 'session'

    #------------------------------



     # Routes for the Company resource:
  # CREATE
  get '/companies/new', controller: 'Companies', action: 'new', as: 'new_company'
  post '/companies', controller: 'Companies', action: 'create'

  # READ
  get '/companies', controller: 'Companies', action: 'index', as: 'companies'
  get '/companies/:id', controller: 'Companies', action: 'show', as: 'company'

   get '/companies/:id/rollups', controller: 'Companies', action: 'rollups', as: 'company_rollups'

   get '/companies/:id/settings', controller: 'Companies', action: 'settings', as: 'company_settings'


  # UPDATE
  get '/companies/:id/edit', controller: 'Companies', action: 'edit', as: 'edit_company'
  put '/companies/:id', controller: 'Companies', action: 'update'

  # DELETE
  delete '/companies/:id', controller: 'Companies', action: 'destroy'


    #------------------------------

 # Routes for the Week resource:

  # READ
  get '/weeks', controller: 'Weeks', action: 'index', as: 'weeks'
  get '/weeks/:id', controller: 'Weeks', action: 'show', as: 'week'


  #------------------------------

  # Nested resources:

  resources :questions do
    resources :responses
  end

  # resources :companies do
    # resources :questions
  # end



  #------------------------------


# Routes for the User resource:

#CREATE

  get '/users/new' => 'Users#new', as: :new_user
  post '/users' => 'Users#create'


#READ

  get '/users' => 'Users#index', as: :users
  get '/users/:id' => 'Users#show', as: :user

#UPDATE

  get '/users/:id/edit' => 'Users#edit', as: :edit_user
  put '/users/:id' => 'Users#update'


#DELETE

  delete '/users/:id' => 'Users#destroy'






end


