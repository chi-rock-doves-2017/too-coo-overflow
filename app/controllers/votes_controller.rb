post '/votes' do
	if logged_in?
	  vote = Vote.new(value: params[:vote].to_i, voter_id: current_user.id)
	  vote.votable_id = params[:votable_id]
	  vote.votable_type = params[:votable_type]
	  if vote.save
	    if request.xhr?
	      content_type:json
	      {vote_count: vote}.to_json
	    end
	    redirect back
	  else
	    @errors = ["Your doot didn't poot, sorry!"]
	    erb :index
	  end

	else
		@errors = ["You are not logged in to vote!"]
	  erb :'sessions/new'
	end

end

