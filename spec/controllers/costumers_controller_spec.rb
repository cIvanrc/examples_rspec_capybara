require 'rails_helper'

RSpec.describe CostumersController, type: :controller do

  it 'respond successfully' do
    get :index
    expect(response).to be_successful
  end

  it '#show (not authorized)' do
    customer = create(:costumer)
    get :show, params: { id: customer.id } 
    expect(response).to have_http_status(302)
  end

  it '#show' do
    member = create(:member)
    customer = create(:costumer)

    sign_in member
    get :show, params: { id: customer.id } 
    expect(response).to have_http_status(200)
  end
end
