
require 'faker'
require 'ffaker'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

300.times do
     Team.create(    
        name: Faker::Team.name
      ) 
end
p "create Teams"

300.times do
     User.create(
        email: FFaker::Internet.safe_email,
        password: FFaker::Internet.password,
        first_name: FFaker::Name.first_name,
        last_name: FFaker::Name.last_name
      ) 
end 
p "create Users"

300.times do
     Project.create(
        name: Faker::Commerce.product_name,
        summary: Faker::Lorem.paragraph,
        start_date: Faker::Date.backward(13),
        end_date: Faker::Date.forward(21)
      ) 
end
p "create Projects" 

300.times do
     Task.create(
        title: Faker::Name.title,
        content: Faker::Lorem.sentence,
        status: "Open",
        start_date: Faker::Date.backward(14),
        due_date: Faker::Date.forward(23),
        estimation: Faker::Time.between(20.days.ago, Date.today, :all)
      ) 
end
p "create Tasks" 

300.times do
     Post.create(    
        content: FFaker::HealthcareIpsum.phrase
      ) 
end 
p "create Posts" 

300.times do
     Comment.create(    
        content: FFaker::HealthcareIpsum.word
      ) 
end
p "create Comments"

Task.all.each do |task|
	10.times do
		task.comments << Comment.find(1 + Random.rand(300))
	end
end
p "fill Task with comments"

Post.all.each do |post|
	10.times do
		post.comments << Comment.find(1 + Random.rand(300))
	end
end
p "fill Post with comments"

Project.all.each do |project|
	10.times do
		project.tasks << Task.find(1 + Random.rand(300))
		project.posts << Post.find(1 + Random.rand(300))
	end
end
p "fill Projects with tasks and posts"

User.all.each do |user|
	10.times do
		user.tasks << Task.find(1 + Random.rand(300))
		user.posts << Post.find(1 + Random.rand(300))
	end
end
p "fill Users with tasks and posts"

Team.all.each do |team|
	10.times do
		team.projects << Project.find(1 + Random.rand(300))
		team.users << User.find(1 + Random.rand(300))
	end
end
p "fill Teams with users and projects"





