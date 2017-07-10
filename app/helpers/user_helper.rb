helpers do
	def current_user
		@user ||= User.find(session[:user_id]) if logged_in?
	end

	def logged_in?
		!!session[:user_id]
	end

	def create(params)
		@user = User.new(params[:user])
		@user.password = params[:password]
		# 7/5 by saham. took the ! off 
		@user.save
	end
end