require 'spec_helper'

RSpec.describe Fareharbor::Lodging do
  let(:uri) { 'companies/:shortname/lodgings/' }

  specify { expect(described_class.uri).to eq(uri) }
end
