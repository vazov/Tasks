require 'spec_helper'

feature 'Deleting tasks' do
	let!(:project) { FactoryGirl.create(:project) }
	#let!(:user) { FactoryGirl.create(:user) }
	let!(:task) do
		ticket = FactoryGirl.create(:task, project: project)
		#ticket.update(user: user)
	end


  before do
		#sign_in_as!(user)

    visit '/'
    click_link project.name
    click_link task.title
  end

  scenario "Deleting a task" do
    click_link "Delete Task"

    expect(page).to have_content("Task has been deleted.")
    expect(page.current_url).to eq(project_url(project))
  end
end
