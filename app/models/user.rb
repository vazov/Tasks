class User < ActiveRecord::Base
	has_secure_password
	
	has_many :team_users, :class_name => 'TeamUser', dependent: :destroy
	has_many :tasks
	has_many :posts
	has_many :teams, through: :team_users
	validates :first_name, presence: true
end
