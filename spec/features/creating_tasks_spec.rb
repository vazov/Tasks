require 'spec_helper'

feature "Creating Tasks" do
  before do
    project = FactoryGirl.create(:project, name: "OBDtool")
		#user = FactoryGirl.create(:user)

    visit '/'
		click_link project.name
		click_link "New Task"
		#message = "You need to sign in or sign up before continuing."
		#expect(page).to have_content(message)

		#fill_in "Name", with: user.name
		#fill_in "Password", with: user.password
		#click_button "Sign in"

		#click_link project.name
		#click_link "New Ticket"
  end

  scenario "Creating a task" do
    fill_in "Title", with: "Non-standards compliance"
    fill_in "Content", with: "My pages are ugly!"
    click_button "Create Task"

    expect(page).to have_content("Task has been created.")

		# within "#ticket #author" do
		# 	expect(page).to have_content("Created by example@example.com")
		# end
  end

  scenario "Creating a task without valid attributes fails" do
    click_button "Create Task"

    expect(page).to have_content("Task has not been created.")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Content can't be blank")
  end

  scenario "Content must be longer than 10 characters" do
    fill_in "Title", with: "Non-standards compliance"
    fill_in "Content", with: "it sucks"
    click_button "Create Task"

    expect(page).to have_content("Task has not been created.")
    expect(page).to have_content("Content is too short")
  end
end
