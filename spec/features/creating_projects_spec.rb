require 'spec_helper'
require 'rails_helper'

feature 'Creating Projects' do

  before do
    visit '/'
    click_link 'New Project'
  end

  scenario "can create a project" do
    fill_in 'Name', with: 'ECU logger'
    fill_in 'Summary', with: 'Automotive software for DOS '
    click_button 'Create Project'
  	expect(page).to have_content("Project has been created.")
  end 

  scenario "can not create a project without a name" do
    click_button 'Create Project'
    expect(page).to have_content("Project has not been created.")
    expect(page).to have_content("Name can't be blank")
  end 
end
