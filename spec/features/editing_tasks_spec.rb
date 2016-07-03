require 'spec_helper'

feature "Editing tasks" do
	let!(:project) { FactoryGirl.create(:project) }
	#let!(:user) { FactoryGirl.create(:user) }
	let!(:task) do
		task = FactoryGirl.create(:task, project: project)
		#task.update(user: user)
	end

  before do
		#sign_in_as!(user)

    visit '/'
    click_link project.name
    click_link task.title
    click_link "Edit Task"
  end

  scenario "Updating a task" do
    fill_in "Title", with: "J5LS v42"
    click_button "Update Task"

    expect(page).to have_content "Task has been updated."

    within("#task h2") do
      expect(page).to have_content("J5LS v42")
    end

    expect(page).to_not have_content task.title
  end

  scenario "Updating a task with invalid information" do
    fill_in "Title", with: ""
    click_button "Update Task"

    expect(page).to have_content("Task has not been updated.")
  end
end
