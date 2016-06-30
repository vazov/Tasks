require 'spec_helper'
require 'rails_helper'

feature "Viewing projects" do
	scenario "Listing all projects" do
		project = FactoryGirl.create(:project, name: "Matrix")
		visit '/'
        click_link 'Matrix'
        expect(page.current_url).to eql(project_url(project))
    end
end
