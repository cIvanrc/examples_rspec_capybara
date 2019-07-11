require 'rails_helper'

RSpec.feature "Customers", type: :feature do

  it 'visit index page' do
    visit(costumers_path)
    expect(page).to have_current_path(costumers_path)
  end

  it 'create a customer' do
    member = create(:member)
    login_as(member, :scope => :member)
    visit(new_costumer_path)

    fill_in("Name", with: FFaker::Name.name)
    fill_in("Email", with: FFaker::Internet.email)
    fill_in("Address", with: FFaker::Address.street_address)

    click_button('Create Costumer')

    expect(page).to have_content('Costumer was successfully created.')
  end
end
