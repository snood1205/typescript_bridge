require 'spec_helper'

RSpec.describe TypescriptBridge do
  it 'has a version number' do
    expect(TypescriptBridge::VERSION).not_to be nil
  end

  it 'can pass a basic test' do
    expect(true).to be_truthy
  end
end
