require 'spec_helper'

RSpec.describe Fareharbor::Availability do
  let(:uri) { 'companies/:shortname/availabilities/:availability_id' }

  specify { expect(described_class.uri).to eq(uri) }
end
