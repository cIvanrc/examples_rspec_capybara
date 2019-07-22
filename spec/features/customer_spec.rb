require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  scenario "Check customer's link" do
    visit(root_path)
    expect(page).to have_link("Go to Customers")
  end

  scenario "Check link to new customer" do
    visit(root_path)
    click_link("Go to Customers")
    expect(page).to have_content("Listing Customers")
    expect(page).to have_link("New Customer")
  end

  scenario "Check new customer form" do
    member = create(:member)
    login_as(member, :scope => :member)
    visit(costumers_path)
    click_link("New Customer")
    expect(page).to have_content("New Customer Form")
  end
end
