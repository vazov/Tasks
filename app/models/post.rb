class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :project
	has_many :comments, dependent: :destroy
    validates :content, presence: true
end
