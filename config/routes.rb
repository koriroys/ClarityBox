ClarityBox::Application.routes.draw do

# -- Routes for Homepage

	get '/', :controller => 'Pages', :action => 'index', :as => 'home'
  #------------------------------

# -- Routes for About pages

	get '/about', :controller => 'Pages', :action => 'about', :as => 'about'
	get '/story', :controller => 'Pages', :action => 'story', :as => 'story'
	get '/philosophy', :controller => 'Pages', :action => 'philosophy', :as => 'philosophy'

    #------------------------------



 # Routes for the Week resource:
  # CREATE
  get '/weeks/new', controller: 'Weeks', action: 'new', as: 'new_week'
  post '/weeks', controller: 'Weeks', action: 'create'

  # READ
  get '/weeks', controller: 'Weeks', action: 'index', as: 'weeks'
  get '/weeks/:id', controller: 'Weeks', action: 'show', as: 'week'

  # UPDATE
  get '/weeks/:id/edit', controller: 'Weeks', action: 'edit', as: 'edit_week'
  put '/weeks/:id', controller: 'Weeks', action: 'update'

  # DELETE
  delete '/weeks/:id', controller: 'Weeks', action: 'destroy'
  #------------------------------



 # Routes for the Question resource:
  # CREATE
  get '/questions/new', controller: 'Questions', action: 'new', as: 'new_question'
  post '/questions', controller: 'Questions', action: 'create'

  # READ
  get '/questions', controller: 'Questions', action: 'index', as: 'questions'
  get '/questions/:id', controller: 'Questions', action: 'show', as: 'question'

  # UPDATE
  get '/questions/:id/edit', controller: 'Questions', action: 'edit', as: 'edit_question'
  put '/questions/:id', controller: 'Questions', action: 'update'

  # DELETE
  delete '/questions/:id', controller: 'Questions', action: 'destroy'
  #------------------------------



 # Routes for the Response resource:
  # CREATE
  get '/responses/new', controller: 'Responses', action: 'new', as: 'new_response'
  post '/responses', controller: 'Responses', action: 'create'

  # READ
  get '/responses', controller: 'Responses', action: 'index', as: 'responses'
  get '/responses/:id', controller: 'Responses', action: 'show', as: 'response'

  # UPDATE
  get '/responses/:id/edit', controller: 'Responses', action: 'edit', as: 'edit_response'
  put '/responses/:id', controller: 'Responses', action: 'update'

  # DELETE
  delete '/responses/:id', controller: 'Responses', action: 'destroy'
  #------------------------------





end


