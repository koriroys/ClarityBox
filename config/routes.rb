ClarityBox::Application.routes.draw do

# -- Routes for Homepage

	get '/', :controller => 'Pages', :action => 'index'


# -- Routes for About pages

	get '/about', :controller => 'Pages', :action => 'about'
	get '/story', :controller => 'Pages', :action => 'story'
	get '/philosophy', :controller => 'Pages', :action => 'philosophy'

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



end


