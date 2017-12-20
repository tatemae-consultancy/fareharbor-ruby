require 'spec_helper'

RSpec.describe Fareharbor::AvailabilityLodging do
  let(:uri) { 'companies/:shortname/availabilities/:availability_id/lodgings/' }

  specify { expect(described_class.uri).to eq(uri) }
end
