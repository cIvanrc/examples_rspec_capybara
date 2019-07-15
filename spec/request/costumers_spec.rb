require 'rails_helper'


RSpec.describe "Customers", type: :request do
  describe "GET /costumers" do
    it 'works! reponse status 200' do
      get costumers_path
      expect(response).to have_http_status(200)
    end

    it 'response json' do
      get costumers_path
      expect(response.body).to include_json([
        name: "test" 
      ])
    end

    it 'create - Json' do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { "ACCEPT" => "application/json" }

      customer_params = attributes_for(:costumer)

      post "/costumers",
        params: { costumer: customer_params },
        headers: headers

      expect(response.body).to include_json(
        id: /\d/,
        name: customer_params[:name],
        email: customer_params[:email]
      )
    end
  end
end
