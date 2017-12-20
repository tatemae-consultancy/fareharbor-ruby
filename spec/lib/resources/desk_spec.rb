require 'spec_helper'

RSpec.describe Fareharbor::Desk do
  let(:uri) { 'companies/:shortname/desks/' }

  specify { expect(described_class.uri).to eq(uri) }
end
