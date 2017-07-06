get '/comments/new' do
  @commentable_type = params[:commentable_type]
  @commentable_id = params[:commentable_id]
  erb :'comments/new'
end

post '/comments' do
  @comment = Comment.new(params[:comment])
  if @comment.save
    redirect "/questions/#{session[:question_id]}"
  else
    @errors = ["Comments cannot be blank, Please write something"]
    erb :'comments/new'
  end

end