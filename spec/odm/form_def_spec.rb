require 'spec_helper'

describe Odm::FormDef do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::FormDef.new(document, "FORM_OID", "Name", "Yes")
    expect(node.to_s).to eq("<FormDef OID=\"FORM_OID\" Name=\"Name\" Repeating=\"Yes\"/>")
  end

  it 'add_description' do
    document = Nokogiri::XML::Document.new()
    node = Odm::FormDef.new(document, "FORM_OID", "Name", "Yes")
    node.add_description
    expect(node.to_s).to eq("<FormDef OID=\"FORM_OID\" Name=\"Name\" Repeating=\"Yes\">\n  <Description/>\n</FormDef>")
  end

	it 'add_form_ref' do
    document = Nokogiri::XML::Document.new()
    node = Odm::FormDef.new(document, "FORM_OID", "Name", "Yes")
    node.add_item_group_ref("IG_OID", "1", "Yes", "CEC_OID")
    expect(node.to_s).to eq("<FormDef OID=\"FORM_OID\" Name=\"Name\" Repeating=\"Yes\">\n  <ItemGroupRef ItemGroupOID=\"IG_OID\" OrderNumber=\"1\" Mandatory=\"Yes\" CollectionExceptionConditionOID=\"CEC_OID\"/>\n</FormDef>")
  end

  it 'add_alias' do
    document = Nokogiri::XML::Document.new()
    node = Odm::FormDef.new(document, "FORM_OID", "Name", "Yes")
    node.add_alias("NCI", "C12345")
    expect(node.to_s).to eq("<FormDef OID=\"FORM_OID\" Name=\"Name\" Repeating=\"Yes\">\n  <Alias Context=\"NCI\" Name=\"C12345\"/>\n</FormDef>")
  end

end