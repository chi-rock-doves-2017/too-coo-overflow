helpers do
  # def current_user
  #   @user ||= User.find(session[:user_id]) if logged_in?
  # end

  def logged_in?
    !!session[:user_id]
  end
end