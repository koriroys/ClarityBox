ClarityBox::Application.routes.draw do

# Static Webpages
	get '/', :controller => 'pages', :action => 'home'
	get '/test', :controller => 'Test', :action => 'index'
	get '/test/story', :controller => 'Test', :action => 'story'
	get '/test/philosophy', :controller => 'Test', :action => 'philosophy'

# Dynamic Webpages - View the roll-up
	get '/rollup/wk:week_number', :controller => 'App', :action => 'view_rollup'

# Dynamic Webpages - Creating a Question
	get '/question/new', :controller => 'App', :action => 'new_question_form'

	get 'create_new_question', :controller => 'App', :action => 'create_new_question'

	get '/question/complete', :controller => 'App', :action => 'create_new_question'




end


