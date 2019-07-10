require 'rails_helper'

RSpec.describe CostumersController, type: :controller do

  before do
    @member = create(:member)
    @customer = create(:costumer)
  end

  context 'index' do
    it 'respond successfully' do
      get :index
      expect(response).to be_successful
    end
  end

  context 'show' do
    it '#show (not authorized)' do
      get :show, params: { id: @customer.id } 
      expect(response).to have_http_status(302)
    end

    it 'respons a 200 response' do
      sign_in @member
      get :show, params: { id: @customer.id } 
      expect(response).to have_http_status(200)
    end

    it 'render a :show template' do
      sign_in @member
      get :show, params: { id: @customer.id } 
      expect(response).to render_template(:show)
    end
  end

  it '#create' do
    customer_params = attributes_for(:costumer)
    sign_in @member
    expect{
      post :create, params: { costumer: customer_params }
    }.to change(Costumer, :count).by(1)
  end

  it 'flash notice' do
    customer_params = attributes_for(:costumer)
    sign_in @member
    post :create, params: { costumer: customer_params }
    expect(flash[:notice]).to match(/successfully created/)
  end

  it 'content-type' do
    customer_params = attributes_for(:costumer)
    sign_in @member
    post :create, format: :json, params: { costumer: customer_params }
    p response
    expect(response.content_type).to match(/html/)
  end
end
