User.create(name: "Zazu", password: "zazuzazy", email: "zazu@zazu.com")
User.create(name: "Iago", password: "iagoiago", email: "iago@iago.com")
User.create(name: "Toucan Sam", password: "toucansamtoucansam", email: "toucansam@toucansam.com")
User.create(name: "Skuttle", password: "skuttleskuttle", email: "skuttle@skuttle.com")
User.create(name: "Daffy Duck", password: "daffyduckdaffyduck", email: "daffyduck@daffyduck.com")
User.create(name: "Big Bird", password: "bigbirdbigbird", email: "bigbird@bigbird.com")
User.create(name: "Fawkes", password: "fawkesfawkes", email: "fawkes@fawkes.com")
User.create(name: "Falco Lombardi", password: "falcofalco", email: "falco@falco.com")

#-------------------------------

Question.create(title: "Butterbeer", body: "Where can I score some ButterBeer....the special kind?", author_id: 7)
Question.create(title: "Sesame Street", body: "Where the hell am I? I got off at the wrong ramp on the south side", author_id: 6)
Question.create(title: "Trouble I've Seen...", body: "Nooooobody knows the trouble I've seen. / Nooooobody knows my sorrow...", author_id: 1)
Question.create(title: "Wabbit Season?", body: "The goddamned sign said 'Wabbit Season' ten seconds ago but now it says 'Duck Season'. WTF", author_id: 5)
Question.create(title: "Snarfblatt", body: "Why are you calling this thing a 'fork'?", author_id: 4)
Question.create(title: "WTF", body: "What is this 'Fruit Rings' knock-off garbage on sale at Walmart?", author_id: 3)
Question.create(title: "Goddamned Hyenas", body: "These idiots suck at resource management", author_id: 1)
Question.create(title: "How do I do a barrel roll", body: "Do I press R or do I press Z twice?", author_id: 8)
Question.create(title: "TACOS?!", body: "Where they at?!", author_id: 4)
Question.create(title: "Best perches", body: "Where they at?!", author_id: 2)
Question.create(title: "Favorite color for...", body: "What is your favorite car color to poop on?", author_id: 5)


#-----------------------------------

commentable_and_commenter_ids = rand(1..User.all.length)
bodies = ["IDK lol", "You done goofed", "TACOS?!", "Mine! Mine! Mine! Mine!", "All your base are belong to us", "...?", "Gee, I've been saved by Fox. How swell.", "Nooooobody knows the trouble I've seen. Nooooobody knows my sorrow.", "Goddamned messenger owls", "You're a wizard Harry", "16/f/florida u?"]

17.times do
	commentable_and_commenter_ids = rand(1..User.all.length)
	comment_type = ["answer"]
	Answer.create(body: bodies.sample, question_id: commentable_and_commenter_ids, user_id: commentable_and_commenter_ids)
end

45.times do
	data_type = ["Question", "Answer", "Comment"]
	commentable_and_commenter_ids = rand(1..User.all.length)
	Comment.create(body: bodies.sample, commentable_id: commentable_and_commenter_ids, commentable_type: data_type.sample, commenter_id: commentable_and_commenter_ids)
end



30.times do
	vote_value = rand(-7..17)
	data_type = ["Answer", "Comment"]
	commentable_and_commenter_ids = rand(1..User.all.length)
	Vote.create(value: vote_value, votable_id: commentable_and_commenter_ids, votable_type: data_type.sample, voter_id: commentable_and_commenter_ids)
end