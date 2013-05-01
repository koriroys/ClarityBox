ClarityBox::Application.routes.draw do

# -- CLARITYBOX.COM

	get '/', :controller => 'Pages', :action => 'index'
	get '/about', :controller => 'Pages', :action => 'about'
	get '/story', :controller => 'Pages', :action => 'story'
	get '/philosophy', :controller => 'Pages', :action => 'philosophy'




end


