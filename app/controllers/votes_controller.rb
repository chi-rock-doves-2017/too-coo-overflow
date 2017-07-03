post '/votes' do
	# if not logged in, will route to the login page.7/2 added by Saham
	if logged_in?
	  vote = Vote.new(value: params[:vote].to_i, voter_id: current_user.id)
	  vote.votable_id = params[:votable_id]
	  vote.votable_type = params[:votable_type]
	  if vote.save
	    redirect back
	    #if request.xhr?
	    	# p "#{params[:id]}"
	    	# p "where am i"
	     #  p "#{session}"
	     #  p "#{params[:votable_type]}"

	    	#erb :_votes, layout: false, locals: { votable: @question, votable_type: @question.class, votable_id: @question.id}
	    #end
	  else
	    @errors = ["Your doot didn't poot, sorry!"]
	    erb :index
	  end
	else
		@errors = ["You are not logged in to vote!"]
	  erb :'sessions/new'
	end
end
