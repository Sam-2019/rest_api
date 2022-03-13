require 'swagger_helper'

RSpec.describe 'api/v1/user', type: :request do
    path "/api/v1/user" do
        post "Create a User" do
          tags "Users"
          consumes "application/json"
          parameter name: :user, in: :body, schema: {
            type: :object,
            properties: {
              id: { type: :integer },
              first_name: { type: :string },
              last_name: { type: :string },
              email: { type: :string },
              institutions_id: { type: :integer }
            },
            required: ['id', 'first_name','last_name', 'email' ],
          }
            response '201', 'user created' do
            let(:user) { { id: 10, first_name: 'Samuel', last_name: 'Martin' } }
            run_test!
          end
            response '422', 'invalid request' do
            let(:user) { { id: 10 } }
            run_test!
          end
        end
      end
end
