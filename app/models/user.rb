class User < ApplicationRecord
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :password_hash, presence: true

	has_many :questions, foreign_key: :author_id
	has_many :comments, foreign_key: :commenter_id
	has_many :votes, foreign_key: :voter_id
	has_many :answers

  def authenticate(password)
    self.password == password
  end

	include BCrypt

	def password
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end

end
