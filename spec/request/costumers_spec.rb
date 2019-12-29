require 'rails_helper'


RSpec.describe "Customers", type: :request do
  describe "GET /costumers" do
    it 'works! reponse status 200' do
      get costumers_path
      expect(response).to have_http_status(200)
    end
    it 'response json' do
      get costumers_path, headers: { accept: 'application/json' }
      expect(response.body).to include_json([
        name: "Vannesa Kertzmann" 
      ])
    end

    it 'create - Json' do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { accept: "application/json" }

      customer_params = attributes_for(:costumer)

      post "/costumers",
        params: { costumer: customer_params },
        headers: headers

      expect(response.body).to include_json(
        name: customer_params[:name],
        email: customer_params[:email]
      )
    end

    it 'update - JSON' do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { "ACCEPT" => "application/json" }

      costumer = Costumer.first
      costumer.name += " - updated"

      put "/costumers/#{costumer.id}",
        params: { costumer: costumer.attributes },
        headers: headers

      expect(response.body).to include_json(
        id: /\d/,
        name: costumer[:name],
        email: costumer[:email]
      )
    end

    it 'destroy - JSON' do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { "ACCEPT" => "application/json" }

      costumer = Costumer.first

      expect{
        delete "/costumers/#{costumer.id}",
        headers: headers
      }.to change(Costumer, :count).by(-1)
    end

    it 'JSON Schema' do
      get '/costumers/1', headers: { accept: 'application/json' }
      expect(response).to match_response_schema("customer")
    end
  end
end


