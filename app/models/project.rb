class Project < ActiveRecord::Base
	validates :name, presence: true
	has_many :tasks, dependent: :destroy
	has_many :posts, dependent: :destroy
	has_many :assignments
	has_many :teams, through: :assignments
end
