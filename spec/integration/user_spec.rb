require 'swagger_helper'

RSpec.describe 'api/v1/user', type: :request do
    path "/api/v1/user" do
        post "Create a User" do
          tags "users"
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

      # path '/users/{id}' do

      #   get 'Retrieve an user' do
      #     tags 'user'
      #     produces 'application/json'
      #     parameter name: :id, in: :path, type: :string
    
      #     response '200', 'user found' do
      #       schema type: :object,
      #         properties: {
      #           id: { type: :integer },
      #           first_name: { type: :string },
      #           last_name: { type: :string },
      #           email: { type: :string },
      #           institution_id: {type: :integer}
      #         },
      #         required: ['id', 'first_name', 'last_name', 'email', 'institution_id' ],
    
      #         let(:id) { user.create(first_name: 'Major', last_name: 'Martey', email: 'major@gmail.com', institution_id: 26 ).id }
      #       run_test!
      #     end
    
      #     response '404', 'user not found' do
      #       let(:id) { 'invalid' }
      #       run_test!
      #     end
    
      #     response '406', 'unsupported accept header' do
      #       let(:'Accept') { 'application/foo' }
      #       run_test!
      #     end
      #   end
        
      # end
end
