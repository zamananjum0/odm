require 'spec_helper'

describe Odm::CodeListRef do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::CodeListRef.new(document, "OID")
    expect(node.to_s).to eq("<CodeListRef CodeListOID=\"OID\"/>")
  end
  
end