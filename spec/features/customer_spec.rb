require 'rails_helper'

RSpec.feature "Customers", type: :feature do
    let(:new_customer_form) { NewCustomerForm.new }

  it 'visit index page' do
    visit(costumers_path)
    expect(page).to have_current_path(costumers_path)
  end
  
  it 'ajax' do
    visit(costumers_path)
    click_link('Add Message')
    # print page.html
    # expect(page).to have_content('Yes!')
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

  it 'Create a customer - Page Object Pattern' do
    new_customer_form.login.visit_page.fill_in_with(
      name: FFaker::Name.name,
      email: FFaker::Internet.email,
      address: FFaker::Address.street_address
    ).submit
    
    expect(page).to have_content('Costumer was successfully created.')
  end

end
