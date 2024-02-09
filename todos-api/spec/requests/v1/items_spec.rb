require 'swagger_helper'

RSpec.describe 'v1/items', type: :request do

  path '/todos/{todo_id}/items' do
    # You'll want to customize the parameter types...
    parameter name: 'todo_id', in: :path, type: :string, description: 'todo_id'

    get('Get all todo items') do
      tags 'Todo Items'
      security [Bearer: []]
      response(200, 'successful') do
        let(:todo_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      response(404, 'not found') do
        let(:id) { 'invalid_id' } # Set an invalid id for the example
        run_test!
      end
      response(422, 'invalid request') do
        let(:'Authorization') { 'invalid_token' } # Set an invalid token for the example         
        run_test!       
      end
    end

    post('Create a new todo item') do
      tags 'Todo Items'
      consumes 'application/json'

      parameter name: :todo, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          done: { type: :boolean, default: false }
        },
        required: [ 'name', 'done' ]
      }

      security [Bearer: []]

      response(201, 'created') do
        let(:todo_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      response(404, 'not found') do
        let(:id) { 'invalid_id' } # Set an invalid id for the example
        run_test!
      end
      response(422, 'invalid request') do
        let(:'Authorization') { 'invalid_token' } # Set an invalid token for the example         
        run_test!       
      end
    end
  end

  path '/todos/{todo_id}/items/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'todo_id', in: :path, type: :string, description: 'todo_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('Get a todo item') do
      tags 'Todo Items'
      security [Bearer: []]
      response(200, 'successful') do
        let(:todo_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      response(404, 'not found') do
        let(:id) { 'invalid_id' } # Set an invalid id for the example
        run_test!
      end
      response(422, 'invalid request') do
        let(:'Authorization') { 'invalid_token' } # Set an invalid token for the example         
        run_test!       
      end
    end

    put('Update a todo item') do
      tags 'Todo Items'
      consumes 'application/json'

      parameter name: :todo, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          done: { type: :boolean }
        },
        required: [ 'name', 'done' ]
      }

      security [Bearer: []]

      response(204, 'successful with no content') do
        let(:todo_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      response(404, 'not found') do
        let(:id) { 'invalid_id' } # Set an invalid id for the example
        run_test!
      end
      response(422, 'invalid request') do
        let(:'Authorization') { 'invalid_token' } # Set an invalid token for the example         
        run_test!       
      end
    end

    delete('Delete a todo item') do
      tags 'Todo Items'
      security [Bearer: []]
      response(204, 'successful with no content') do
        let(:todo_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      response(404, 'not found') do
        let(:id) { 'invalid_id' } # Set an invalid id for the example
        run_test!
      end
      response(422, 'invalid request') do
        let(:'Authorization') { 'invalid_token' } # Set an invalid token for the example         
        run_test!       
      end
    end
  end
end
