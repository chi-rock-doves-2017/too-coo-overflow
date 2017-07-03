class Vote < ApplicationRecord
	validates :value, presence: true

	belongs_to :votable, polymorphic: true
	belongs_to :voter, class_name: :User, foreign_key: :voter_id #changed from strings to symbols for consistancy
	def upvote
		self.user.vote +=1
	end

	def downvote
		self.user.vote -= 1
	end
end
