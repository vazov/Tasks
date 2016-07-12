class Project < ActiveRecord::Base
	has_many :tasks, dependent: :destroy
	has_many :posts, dependent: :destroy
	has_many :assignments, dependent: :destroy
	has_many :teams, through: :assignments
	validates :name, presence: true
    validates :summary, presence: true, presence: true, length: { minimum: 10 }
    validates :start_date, presence: true
    validates :end_date, presence: true
end
