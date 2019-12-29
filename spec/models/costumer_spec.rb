# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Costumer, type: :model do
  context 'costumer name' do
    it '#full_name - overwriting attribute' do
      costumer = create(:costumer, name: 'Ivan')
      expect(costumer.full_name).to eq('Sr. Ivan')
    end

    it '#full_name' do
      costumer = create(:costumer)
      expect(costumer.full_name).to start_with('Sr.')
    end
  end

  context 'as a costumer vip' do
    it '#costumer_vip' do
      costumer = create(:costumer_vip)
      expect(costumer.vip).to be_truthy
    end

    it '#costumer_male_vip' do
      costumer = create(:costumer_male_vip)
      expect(costumer.gender).to eq('M')
      expect(costumer.vip).to be_truthy
    end

    it '#costumer_female_vip' do
      costumer = create(:costumer_female_vip)
      expect(costumer.gender).to eq('F')
      expect(costumer.vip).to be_truthy
    end
  end

  context 'as a costumer default' do
    it '#costumer_default' do
      costumer = create(:costumer_default)
      expect(costumer.vip).to be_falsey
    end

    it '#costumer_male_default' do
      costumer = create(:costumer_male_default)
      expect(costumer.gender).to eq('M')
      expect(costumer.vip).to be_falsey
    end

    it '#costumer_female_default' do
      costumer = create(:costumer_female_default)
      expect(costumer.gender).to eq('F')
      expect(costumer.vip).to be_falsey
    end
  end

  context 'costumer gender' do
    it '#costumer_male' do
      costumer = create(:costumer_male)
      expect(costumer.gender).to eq('M')
    end

    it '#costumer_female' do
      costumer = create(:costumer_female)
      expect(costumer.gender).to eq('F')
    end
  end


  context 'on create' do
    it { expect { create(:costumer) }.to change { Costumer.all.size }.by(1) }
  end
end
