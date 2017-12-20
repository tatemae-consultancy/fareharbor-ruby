require 'spec_helper'

RSpec.describe Fareharbor::Item do
  let(:uri) { 'companies/:shortname/items/' }

  specify { expect(described_class.uri).to eq(uri) }
end
