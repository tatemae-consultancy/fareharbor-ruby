require 'spec_helper'

RSpec.describe Fareharbor::Company do
  let(:availability_id) { 1234 }
  let(:company) { Fareharbor::Company.all.first }
  let(:companies_json) { fixture('companies.json') }
  let(:companies_url) { "#{Fareharbor.configuration.fareharbor_url}/companies" }
  let(:shortname) { 'hawaiianadventures' }

  before do
    stub_request(:get, companies_url).to_return(body: companies_json, status: 200)
  end

  specify { expect(described_class.uri).to eq('companies/') }

  describe :all do
    subject { Fareharbor::Company.all.first }

    it 'returns an array of companies' do
      expect(subject.name).to eq('Hawaiian Adventures')
    end
  end

  describe :agents do
    subject { company.agents.first }
    let(:agents_json) { fixture('agents.json') }
    let(:agents_url) { "#{Fareharbor.configuration.fareharbor_url}/companies/#{shortname}/agents" }

    before do
      stub_request(:get, agents_url).to_return(body: agents_json, status: 200)
    end

    it 'returns an array of agents' do
      expect(subject.name).to eq('Eddie')
    end
  end

  describe :availability_logdings do
    subject { company.availability_logdings(availability_id: availability_id).first }
    let(:availability_logdings_json) { fixture('availability_lodgings.json') }
    let(:availability_logdings_url) do
      "#{Fareharbor.configuration.fareharbor_url}/companies/#{shortname}/availabilities/#{availability_id}/lodgings"
    end

    before do
      stub_request(:get, availability_logdings_url).to_return(
        body: availability_logdings_json,
        status: 200
      )
    end

    it 'returns an array of lodgings' do
      expect(subject.name).to eq('Wyndham Royal Garden')
      expect(subject.is_pickup_available).to be_truthy
    end
  end

  describe :desks do
    subject { company.desks.first }
    let(:desks_json) { fixture('desks.json') }
    let(:desks_url) { "#{Fareharbor.configuration.fareharbor_url}/companies/#{shortname}/desks" }

    before do
      stub_request(:get, desks_url).to_return(body: desks_json, status: 200)
    end

    it 'returns an array of desks' do
      expect(subject.name).to eq('Windward Side')
    end
  end

  describe :items do
    subject { company.items.first }
    let(:items_json) { fixture('items.json') }
    let(:items_url) { "#{Fareharbor.configuration.fareharbor_url}/companies/#{shortname}/items" }

    before do
      stub_request(:get, items_url).to_return(body: items_json, status: 200)
    end

    it 'returns an array of items' do
      expect(subject.name).to eq('Jet Ski Tour')
      expect(subject.customer_prototypes.first.display_name).to eq('Adult')
      expect(subject.images.first.gallery).to eq('carousel')
    end
  end

  describe :lodgings do
    subject { company.lodgings.first }
    let(:lodgings_json) { fixture('lodgings.json') }
    let(:lodgings_url) do
      "#{Fareharbor.configuration.fareharbor_url}/companies/#{shortname}/lodgings"
    end

    before do
      stub_request(:get, lodgings_url).to_return(body: lodgings_json, status: 200)
    end

    it 'returns an array of lodgings' do
      expect(subject.name).to eq('Wyndham Royal Garden')
      expect(subject.is_self_lodging).to be_falsey
    end
  end
end
