class Team < ActiveRecord::Base
	has_many :users
	has_many :assignments
	has_many :projects, through: :assignments
end
