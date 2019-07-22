require 'rails_helper'

feature "Welcomes", type: :feature do

  scenario 'Show "Welcome" message' do
    visit(root_path)
    expect(page).to have_content("Welcome")
  end

  scenario "Check customer's link" do
    visit(root_path)
    expect(page).to have_link("Go to Customers")
  end
end
