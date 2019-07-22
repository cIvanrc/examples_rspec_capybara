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

  scenario "Register a valid new customer" do
    member = create(:member)
    login_as(member, :scope => :member)
    visit(new_costumer_path)
    customer_name = FFaker::Name.name
    fill_in("Name", with: customer_name)
    fill_in("Email", with: FFaker::Internet.email)
    fill_in("Address", with: FFaker::Address.street_address)
    fill_in("Telephone", with: FFaker::PhoneNumber.phone_number)
    attach_file("Avatar", "#{Rails.root}/spec/fixtures/avatar.png")
    choose(option: ['S', 'N'].sample)
    click_on('Create Customer')

    expect(page).to have_content("Customer created successfully")
    expect(Costumer.last.name).to eq(customer_name)
  end

  scenario "sad path" do
    member = create(:member)
    login_as(member, :scope => :member)
    visit(new_costumer_path)
    click_on('Create Customer')

    expect(page).to have_content("can't be blank")
  end

  context '#show' do
    scenario "display customer" do
      member = create(:member)
      login_as(member, :scope => :member)

      customer = create(:costumer)
      visit(costumer_path(customer.id))

      expect(page).to have_content(customer.name)
    end
  end
end
