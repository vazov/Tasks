require 'spec_helper'
require 'rails_helper'

feature "Deleting projects" do
  scenario "Deleting a project" do
    FactoryGirl.create(:project, name: "Matrix 2")

    visit "/"
    click_link "Matrix 2"
    click_link "Delete Project"

    expect(page).to have_content("Project has been destroyed.")

    visit "/"

    expect(page).to have_no_content("Matrix 2")
  end
end
