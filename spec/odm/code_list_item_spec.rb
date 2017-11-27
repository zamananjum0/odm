require 'spec_helper'

describe Odm::CodeListItem do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::CodeListItem.new(document, "CODED", "1", "15")
    expect(node.to_s).to eq("<CodeListItem CodedValue=\"CODED\" Rank=\"1\" OrderNumber=\"15\"/>")
  end
  
  it 'add_decode' do
    document = Nokogiri::XML::Document.new()
    node = Odm::CodeListItem.new(document, "CODED", "1", "15")
    node.add_decode
    expect(node.to_s).to eq("<CodeListItem CodedValue=\"CODED\" Rank=\"1\" OrderNumber=\"15\">\n  <Decode/>\n</CodeListItem>")
  end

	it 'add_alias' do
    document = Nokogiri::XML::Document.new()
    node = Odm::CodeListItem.new(document, "CODED", "1", "15")
    node.add_alias("NCI", "C12345")
    expect(node.to_s).to eq("<CodeListItem CodedValue=\"CODED\" Rank=\"1\" OrderNumber=\"15\">\n  <Alias Context=\"NCI\" Name=\"C12345\"/>\n</CodeListItem>")
  end

end