get '/users/new' do 
	erb :'users/new'
end

post '/users' do 
	if params[:password] == params[:password_confirmation]
		#7/5 by saham. If email already taken, return an error and redirect to the new screen
		if create(params)
		redirect '/sessions/new'
	else 
		@errors = ['Email already taken, please try again.']
		erb :'users/new'
	end
	else
		@errors = ['Password does not match, please try again.']
		erb :'users/new'
	end
end



