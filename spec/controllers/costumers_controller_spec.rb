require 'rails_helper'

RSpec.describe CostumersController, type: :controller do

  it 'respond successfully' do
    get :index
    expect(response).to be_successful
  end
end
