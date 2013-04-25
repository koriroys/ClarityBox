ClarityBox::Application.routes.draw do

# -- CLARITYBOX.COM

	get '/', :controller => 'Pages', :action => 'index'
	get '/about', :controller => 'Pages', :action => 'about'
	get '/story', :controller => 'Pages', :action => 'story'
	get '/philosophy', :controller => 'Pages', :action => 'philosophy'


# -- CLARITYBOX.COM/QUESTION

# ---- CREATE

  get '/question/new', :controller => 'Question', :action => 'new'
  post '/question', :controller => 'Question', :action => 'create'

# ---- READ
  get '/question', :controller => 'Question', :action => 'index'
  get '/question/:id', :controller => 'Question', :action => 'show', :as => :roll_up

#----UPDATE
  get '/question/:id/edit', :controller => 'Question', :action => 'edit'
  put '/question/:id', :controller => 'Question', :action => 'update'

#----DELETE
  delete '/question/:id', :controller => 'Question', :action => 'destroy'






end


