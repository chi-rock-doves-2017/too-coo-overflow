class User < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true
	validates :password_hash, presence: true

	has_many :questions, foreign_key: :author_id
	has_many :comments, foreign_key: :commenter_id
	has_many :votes, foreign_key: :voter_id
	has_many :answers
end
