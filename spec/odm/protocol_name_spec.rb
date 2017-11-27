require 'spec_helper'

describe Odm::ProtocolName do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::ProtocolName.new(document, "Protocol AX1")
    expect(node.to_s).to eq("<ProtocolName>Protocol AX1</ProtocolName>")
  end
  
end