class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 10 }
  validates :status, presence: true
  validates :start_date, presence: true
  validates :due_date, presence: true
  validates :estimation, presence: true
  STATUS = %w(Open Closed)
end
