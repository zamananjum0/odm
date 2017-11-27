require 'spec_helper'

describe Odm::CodeList do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::CodeList.new(document, "SE_OID", "Code List", "String", "$1")
    expect(node.to_s).to eq("<CodeList OID=\"SE_OID\" Name=\"Code List\" DataType=\"String\" SASFormatName=\"$1\"/>")
  end
  
  it 'add_description' do
    document = Nokogiri::XML::Document.new()
    node = Odm::CodeList.new(document, "SE_OID", "Code List", "String", "$1")
    node.add_description
    expect(node.to_s).to eq("<CodeList OID=\"SE_OID\" Name=\"Code List\" DataType=\"String\" SASFormatName=\"$1\">\n  <Description/>\n</CodeList>")
  end

  it 'add_code_list_item' do
    document = Nokogiri::XML::Document.new()
    node = Odm::CodeList.new(document, "SE_OID", "Code List", "String", "$1")
    node.add_code_list_item("NOTATION", "1", "2")
    expect(node.to_s).to eq("<CodeList OID=\"SE_OID\" Name=\"Code List\" DataType=\"String\" SASFormatName=\"$1\">\n  <CodeListItem CodedValue=\"NOTATION\" Rank=\"1\" OrderNumber=\"2\"/>\n</CodeList>")
  end

	it 'add_alias' do
    document = Nokogiri::XML::Document.new()
    node = Odm::CodeList.new(document, "SE_OID", "Code List", "String", "$1")
    node.add_alias("NCI", "C12345")
    expect(node.to_s).to eq("<CodeList OID=\"SE_OID\" Name=\"Code List\" DataType=\"String\" SASFormatName=\"$1\">\n  <Alias Context=\"NCI\" Name=\"C12345\"/>\n</CodeList>")
  end

end