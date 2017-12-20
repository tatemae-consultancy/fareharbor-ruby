require 'spec_helper'

RSpec.describe Fareharbor do
  before(:each) { Fareharbor.reset }

  describe 'spyke connection properties' do
    subject { Spyke::Base.connection }
    before { Fareharbor.configure }

    it 'configures authorization headers' do
      expect(subject.headers['X-FareHarbor-API-App']).to be_nil
      expect(subject.headers['X-FareHarbor-API-User']).to be_nil
    end
  end

  describe :configuration do
    subject { Fareharbor.configuration }
    let(:fareharbor_url) { 'http://a-custom-url' }
    let(:app_token) { 'app-token' }
    let(:user_token) { 'user-token' }

    context 'configured' do
      before do
        Fareharbor.configure do |config|
          config.fareharbor_url  = fareharbor_url
          config.app_token       = app_token
          config.user_token      = user_token
        end
      end

      specify { expect(subject.fareharbor_url).to eq(fareharbor_url) }
      specify { expect(subject.app_token).to eq(app_token) }
      specify { expect(subject.user_token).to eq(user_token) }
    end
  end
end
