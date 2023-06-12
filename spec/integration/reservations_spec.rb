require 'swagger_helper'

RSpec.describe 'reservations', type: :request do
  path '/users/reservations/create' do
    post('create reservations') do
      tags 'api/reservations'
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/users/reservations/' do
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'

    get('list reservations') do
      tags 'api/slots'
      response(200, 'successful') do
        let(:user_id) { '1' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/users/reservations/{id}' do
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show reservations') do
      tags 'api/reservations'
      response(200, 'successful') do
        let(:user_id) { '1' }
        let(:id) { '1' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete reservations') do
      tags 'api/reservations'
      response(200, 'successful') do
        let(:user_id) { '1' }
        let(:id) { '1' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end