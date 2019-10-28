require './spec/spec_helper'

RSpec.describe Route, type: :request do

  describe 'POST /distances' do

    let!(:d1) { create(:distance_1) } # I use let to create factories because this can be used in describe or context

    context 'when params are valid.' do
      context 'when distance path not exists.' do

        before do
          post '/distances?origin=a&destination=b&kilometers=10'
        end

        it 'should return a success message.' do
          json_body = JSON.parse(last_response.body, symbolize_names: true)

          expect(json_body[:message]).to include('Distance created with success!')
        end

        it 'should return status code 200.' do

          expect(last_response.status).to eq(200)
        end
      end

      context 'when distance path exists.' do

        it 'should update this object.' do
          post '/distances?origin=a&destination=b&kilometers=50'
          json_body = JSON.parse(last_response.body, symbolize_names: true)

          expect(Distance.first.kilometers).to eq(50)
        end
      end
    end

    context 'when params are invalid.' do
      context 'when orign or destination are invalid.' do

        before do
          post '/distances?destination=b&kilometers=10'
        end

        it 'should return a error message.' do
          json_body = JSON.parse(last_response.body, symbolize_names: true)

          expect(json_body[:message]).to include('Origin is too short (minimum is 1 character)')
        end

        it 'should return status code 400.' do

          expect(last_response.status).to eq(400)
        end
      end

      context 'when kilometers are invalid.' do

        it 'should return a error message.' do
          post '/distances?origin=a&destination=b&kilometers=10000000000'
          json_body = JSON.parse(last_response.body, symbolize_names: true)

          expect(json_body[:message]).to include('Kilometers must be less than or equal to 100000')
        end
      end
    end
  end
end
