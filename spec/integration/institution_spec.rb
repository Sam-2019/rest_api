require 'swagger_helper'

RSpec.describe 'api/v1/institution', type: :request do
    path "/api/v1/institution" do
        post "Create a institution" do
          tags "institutions"
          consumes "application/json"
          parameter name: :institution, in: :body, schema: {
            type: :object,
            properties: {
              id: { type: :integer },
              name: { type: :string },
              location: { type: :string },
            },
            required: ["id", "name","location" ],
          }
            response "201", "institution created" do
            let(:institution) { { id: 10, name: "UPSA", location: "Legon" } }
            run_test!
          end
            response "422", "invalid request" do
            let(:institution) { { id: 10 } }
            run_test!
          end
        end
      end
end
