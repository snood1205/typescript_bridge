require 'spec_helper'

describe 'Interface parsing' do
  before(:all) do
    interface_string = <<~TYPESCRIPT
      interface Basic {
        example: string;
        value?: number;
      }
    TYPESCRIPT
    @interface = Interfacer.parse(interface_string)
  end

  it 'should correctly name an interface' do
    expect(@interface.name).to eq 'Basic'
  end

  it 'should have correctly named attributes' do
    attribute_names = @interface.attributes.map(&:name)
    expect(attribute_names).to include 'example'
    expect(attribute_names).to include 'value'
  end
end
