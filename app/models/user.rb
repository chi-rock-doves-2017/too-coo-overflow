class User < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true
	validates :password_hash, presence: true

	has_many :questions
	has_many :comments
	has_many :votes
	has_many :answers
end
