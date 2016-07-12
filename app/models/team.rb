class Team < ActiveRecord::Base
	has_many :team_users, :class_name => 'TeamUser', dependent: :destroy
	has_many :assignments, dependent: :destroy
	has_many :projects, through: :assignments
	has_many :users, through: :team_users
	validates :name, presence: true
end
