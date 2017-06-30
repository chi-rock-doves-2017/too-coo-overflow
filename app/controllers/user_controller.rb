get '/users/new' do 
	erb :'users/new'
end

post '/users' do 
	if params[:password] == params[:password_confirmation]
		create(params)
		redirect '/sessions/new'
	else
		@errors = ['Passwords do not match, please try again.']
		erb :'users/new'
	end
end



