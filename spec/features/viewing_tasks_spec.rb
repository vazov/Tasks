require 'spec_helper'

feature "Viewing tasks" do
  before do
    matrix = FactoryGirl.create(:project,
                                    name: "Matrix")

		
		task = FactoryGirl.create(:task,
						project: matrix,
						title: "J5LS_V43C",
						content: "Adding 3-6 cylinders engine support!")
		

    AEM = FactoryGirl.create(:project,
                                      name: "AEMtuner_Software")
    FactoryGirl.create(:task,
            project: AEM,
            title: "Color",
            content: "Colored tables and maps.")
		

    visit '/'
  end

  scenario "Viewing tasks for a given project" do
    click_link "Matrix"

    expect(page).to have_content("J5LS_V43C")
    expect(page).to_not have_content("Colored tables and maps.")

    click_link "J5LS_V43C"
    within("#task h2") do
      expect(page).to have_content("J5LS_V43C")
    end
    expect(page).to have_content("Adding 3-6 cylinders engine support!")
  end
end
