require 'rails_helper'

RSpec.feature "Customers", type: :feature do

  it 'visit index page' do
    visit(costumers_path)
    print page.html
    expect(page).to have_current_path(costumers_path)
  end
end
