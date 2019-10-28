require './spec/spec_helper'

RSpec.describe ApplicationHelper, type: :helper do

  describe 'class methods' do
    describe '#parse_values' do
      context 'when params contains uppercase letters.'do
        it 'should return in downcase.' do
          params = {'origin'=> 'A', 'destination'=> 'B' }

          expect(ApplicationHelper.parse_values(params)).to eq({'origin'=> 'a', 'destination'=> 'b' })
        end
      end

      context 'when params are invalid.' do
        it 'should return params.' do
          params = {}

          expect(ApplicationHelper.parse_values(params)).to eq({})
        end
      end
    end

    describe '#parse_edges' do
      context 'when no have records in db.' do
        it 'should return a empty array.' do
          distances = []

          expect(ApplicationHelper.parse_edges(distances)).to eq([])
        end
      end

      context 'when have more than 1 record in db.' do
        it 'should return a parsed matrix.' do
          create(:distance_1)
          distances = Distance.all

          expect(ApplicationHelper.parse_edges(distances)).to eq([["a", "b", 10]])
        end
      end
    end
  end
end
