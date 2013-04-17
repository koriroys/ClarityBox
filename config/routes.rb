ClarityBox::Application.routes.draw do

	get('/', {:controller => 'pages', :action => 'home'})

	get('/test', {:controller => 'Test', :action => 'index'})
	get('/test/story', {:controller => 'Test', :action => 'story'})
	get('/test/philosophy', {:controller => 'Test', :action => 'philosophy'})

end


