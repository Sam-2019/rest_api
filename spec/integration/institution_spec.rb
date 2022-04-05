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

      path '/institutions/{id}' do

        get 'Retrieve an institution' do
          tags 'institution'
          produces 'application/json'
          parameter name: :id, in: :path, type: :string
    
          response '200', 'institution found' do
            schema type: :object,
              properties: {
                id: { type: :integer },
                name: { type: :string },
                location: { type: :string }
              },
              required: [ 'id', 'name', 'location' ]
    
            let(:id) { Institution.create(name: 'MIT', location: 'Massachusetts').id }
            run_test!
          end
    
          response '404', 'institution not found' do
            let(:id) { 'invalid' }
            run_test!
          end
    
          response '406', 'unsupported accept header' do
            let(:'Accept') { 'application/foo' }
            run_test!
          end
        end

    end
end
