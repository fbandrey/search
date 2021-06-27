require 'rails_helper'

RSpec.describe Api::ProceduresController, type: :controller do
  describe '#index' do
    let(:json_data) { JSON.parse(response.body) }
    let(:items) { json_data['procedures'] }

    subject { get :index, params: { q: q } }

    before do
      titles.each { |title| create(:procedure, title: title) }
      subject
    end

    context 'when there are "Heat therapy" and "Thermography" only' do
      let(:titles) { ['Heat therapy', 'Thermography'] }

      context 'when query is "the"' do
        let(:q) { 'the' }

        it 'the 1st item should be "Thermography"' do
          expect(items.first['title']).to eq titles.last
        end

        it 'the last one should be "Heat therapy"' do
          expect(items.last['title']).to eq titles.first
        end
      end

      context 'when query is "foo"' do
        let(:q) { 'foo' }

        it 'the list of items should be empty' do
          expect(items).to be_empty
        end
      end

      context 'when query is none' do
        let(:q) { nil }

        it 'should return full list of items' do
          expect(items.size).to eq Procedure.count
        end
      end
    end
  end
end
