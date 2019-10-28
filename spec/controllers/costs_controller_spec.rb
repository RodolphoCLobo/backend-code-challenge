require './spec/spec_helper'

RSpec.describe CostsController, type: :controller do
  describe 'class methods' do
    describe '#weight_is_valid?' do
      context 'when weight is valid.' do
        context 'when weight is equal 50.' do
          it 'should return true.' do
            weight = 50

            expect(CostsController.weight_is_valid?(weight)).to eq(true)
          end
        end
      end

      context 'when weight is invalid.' do
        context 'when weight is less than 0.' do
          it 'should return false.' do
            weight = -1

            expect(CostsController.weight_is_valid?(weight)).to eq(false)
          end
        end

        context 'when weight is greater than 50.' do
          it 'should return false.' do
            weight = 51

            expect(CostsController.weight_is_valid?(weight)).to eq(false)
          end
        end
      end
    end

    describe '#search_best_path' do

      let!(:d1) { create(:distance_1) }
      let!(:d2) { create(:distance_2) }
      let!(:d3) { create(:distance_3) }

      context 'when params are valid.' do

        it 'should return a hash with the shortest path.' do
          params = { 'origin'=> 'a', 'destination'=> 'c'}

          expect(CostsController.search_best_path(params)[:shortest_path]).to eq(["a", "b", "c"])
        end

        it 'should return a hash with the distance of shortest path.' do
          params = { 'origin'=> 'a', 'destination'=> 'c'}

          expect(CostsController.search_best_path(params)[:kilometers]).to eq(25)
        end
      end
      # when params are not valid is captured and tested in #calculate_cost.
    end
  end
end
