# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do
  describe '#search_by_name' do
    let!(:city) { create(:city, name: 'Curitiba') }
    subject(:search_by_name) { described_class.search_by_name(search_param_name) }

    context 'when param city name is similar as existing city' do
      let(:search_param_name) { 'curiba' }

      it 'returns city' do
        expect(search_by_name.to_a).to eq([city])
      end
    end

    context 'when param city name is exactly the same as existing city' do
      let(:search_param_name) { 'Curitiba' }

      it 'returns city' do
        expect(search_by_name.to_a).to eq([city])
      end
    end

    context 'when param city name is different from all city names' do
      let(:search_param_name) { 'Floripa' }

      it 'returns nothing' do
        expect(search_by_name.to_a).to eq([])
      end
    end
  end

  describe '#search_by_state_name' do
    let(:state) { create(:state, name: 'Paraná') }
    let!(:city) { create(:city, name: 'Curitiba', state: state) }
    subject(:search_by_state_name) { described_class.search_by_state_name(search_param_state_name) }

    context 'when params state name is similar as existing state' do
      let(:search_param_state_name) { 'paran' }

      it 'returns city' do
        expect(search_by_state_name.to_a).to eq([city])
      end
    end

    context 'when params state name is exactly the same as existing state' do
      let(:search_param_state_name) { 'Paraná' }

      it 'returns city' do
        expect(search_by_state_name.to_a).to eq([city])
      end
    end

    context 'when params state name is differente from all state names' do
      let(:search_param_state_name) { 'Santa Catarina' }

      it 'returns nothing' do
        expect(search_by_state_name.to_a).to eq([])
      end
    end
  end
end
