class Task < ActiveRecord::Base
  belongs_to :project
  validates :title, presence: true
  validates :content, presence: true, presence: true, length: { minimum: 10 }
end
