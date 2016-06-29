require 'spec_helper'
require 'rails_helper'

feature 'Creating Projects' do
  scenario "can create a project" do
  #   fill_in 'Name', with: 'TextMate 2'
  #   fill_in 'Description', with: 'A text-editor for OS X'
  #   expect(page).to have_content('Project has been created.')   
  #   project = Project.where(name: "TextMate 2").first
  #   expect(page.current_url).to eql(project_url(project))
  #   title = "TextMate 2 - Projects - Ticketee"
  #   expect(page).to have_title(title)
  # end
  
  #scenario "can not create a project without a name" do
  	visit '/'
    
    click_link 'New Project'
    fill_in 'Name', with: 'ECU logger'
    fill_in 'Summary', with: 'Automotive software for DOS '
    click_button 'Create Project'
  	expect(page).to have_content("Project has been created.")
    #expect(page).to have_content("Name can't be blank")
  end 
end