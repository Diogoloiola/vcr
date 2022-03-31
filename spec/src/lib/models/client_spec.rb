require 'rspec'
require 'vcr'
require 'byebug'
require_relative '../../../../src/lib/models/client'

describe Github do
  let(:user_response) do
    VCR.use_cassette('github/user') { Github.user('ruby') }
  end

  it 'can fetch & parse user data' do
    expect(user_response).to be_kind_of(Hash)

    expect(user_response).to have_key(:id)
    expect(user_response).to have_key(:type)
  end
end
