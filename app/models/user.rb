class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :team_users, :class_name => 'TeamUser', dependent: :destroy
  has_many :tasks
  has_many :posts
  has_many :teams, through: :team_users
  validates :first_name, presence: true
  validates :last_name, presence: true
end
