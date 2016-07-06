class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 10 }
end
