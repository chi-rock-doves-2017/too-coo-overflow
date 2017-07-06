get '/comments/new' do
  redirect '/' unless logged_in?
  erb :'/_comments'
end

post '/comments' do
  @comments = Comment.new(body: params[:body], commentable_id: params[:commentable_id], commentable_type: params[:commentable_type], commenter_id: params[:commenter_id])
  if @comments.save
    @alerts = "Thanks for your comment!"
  else
    @errors = @comments.errors.full_messages
    erb :'/questions/show'
  end
end
