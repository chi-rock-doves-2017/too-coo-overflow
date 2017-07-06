post '/votes' do
	# if not logged in, will route to the login page.7/2 added by Saham
	if logged_in?
	  vote = Vote.new(value: params[:vote].to_i, voter_id: current_user.id)
	  vote.votable_id = params[:votable_id]
	  vote.votable_type = params[:votable_type]
	  if vote.save
	  	
	    if request.xhr?
	    	
	    	 
	    	p "again I am here request.xhr"
	      
	       p "#{params[:votable_type]}"
	       p "#{vote}"
	       p "#{params}"
	       p "#{params[:votable]}"
	       
	    # total_vote = vote_count(params[:votable])
	    # p total_vote
	       
	       content_type:json
	       {vote_count: vote}.to_json
	       
	    #  #else
	     	#redirect back
	     end

	    	
	  else
	    @errors = ["Your doot didn't poot, sorry!"]
	    erb :index
	  end
	else
		@errors = ["You are not logged in to vote!"]
	  erb :'sessions/new'
	end
end
