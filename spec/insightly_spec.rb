require 'spec_helper'

describe Insightly do
  it 'has a version number' do
    expect(Insightly::VERSION).not_to be nil
  end

  it 'provides way to set API key' do
    expect(Insightly).to respond_to(:api_key)
  end

  it 'provides shortcut for instantiating Client' do
    expect(Insightly::Client.new(insightly_api_key)).to be_a(Insightly::Client)
  end
end
