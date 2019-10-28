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
  end
end
