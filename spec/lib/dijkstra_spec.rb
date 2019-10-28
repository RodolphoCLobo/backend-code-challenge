require './spec/spec_helper'

RSpec.describe Dijkstra, type: :lib do

  let!(:d1) { create(:distance_1) }
  let!(:d2) { create(:distance_2) }
  let!(:d3) { create(:distance_3) }

  describe 'class methods' do
    describe '#new' do
      context 'when try create object whith valid params.' do

        it 'should return an object containing the resolved graph.' do
          distances = Distance.all
          edges = ApplicationHelper.parse_edges(distances)

          expect(Dijkstra.new('a', 'c', edges).graph.empty?).to eq(false)
        end

        it 'should return an instance from Dijkstra class.' do
          distances = Distance.all
          edges = ApplicationHelper.parse_edges(distances)

          expect(Dijkstra.new('a', 'c', edges).class).to eq(Dijkstra)
        end
      end
    end
  end

  describe 'instance methods' do
    describe '#shortest_path' do
      it 'should return the shortest path.' do
        distances = Distance.all
        edges = ApplicationHelper.parse_edges(distances)

        expect(Dijkstra.new('a', 'c', edges).shortest_path).to eq(["a", "b", "c"])
      end
    end
  end
end
