require 'spec_helper'

RSpec.describe Fareharbor::Agent do
  let(:uri) { 'companies/:shortname/agents/' }
  
  specify { expect(described_class.uri).to eq(uri) }
end
