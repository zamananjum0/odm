require 'spec_helper'

describe Odm::ItemGroupDef do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::ItemGroupDef.new(document, "ITEM_OID", "Name", "Yes", "Yes", "AE", "AE", "Home", "Purpose", "Logic!")
    expect(node.to_s).to eq("<ItemGroupDef OID=\"ITEM_OID\" Name=\"Name\" Repeating=\"Yes\" IsReferenceData=\"Yes\" SASDatasetName=\"AE\" Domain=\"AE\" Origin=\"Home\" Purpose=\"Purpose\" Comment=\"Logic!\"/>")
  end

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::ItemGroupDef.new(document, "ITEM_OID", "Name", "Yes", "", "", "", "", "", "")
    expect(node.to_s).to eq("<ItemGroupDef OID=\"ITEM_OID\" Name=\"Name\" Repeating=\"Yes\"/>")
  end

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::ItemGroupDef.new(document, "ITEM_OID", "Name", "Yes", "", "", "", "", "", "Hello World")
    expect(node.to_s).to eq("<ItemGroupDef OID=\"ITEM_OID\" Name=\"Name\" Repeating=\"Yes\" Comment=\"Hello World\"/>")
  end

  it 'add_description' do
    document = Nokogiri::XML::Document.new()
    node = Odm::ItemGroupDef.new(document, "ITEM_OID", "Name", "Yes", "", "", "", "", "", "")
    node.add_description
    expect(node.to_s).to eq("<ItemGroupDef OID=\"ITEM_OID\" Name=\"Name\" Repeating=\"Yes\">\n  <Description/>\n</ItemGroupDef>")
  end

	it 'add_item_ref' do
    document = Nokogiri::XML::Document.new()
    node = Odm::ItemGroupDef.new(document, "ITEM_OID", "Name", "Yes", "", "", "", "", "", "")
    node.add_item_ref("OID", "4", "Yes", "No", "MOID", "Role", "ROLE_OID", "CEC_OID")
    expect(node.to_s).to eq("<ItemGroupDef OID=\"ITEM_OID\" Name=\"Name\" Repeating=\"Yes\">\n  <ItemRef ItemOID=\"OID\" OrderNumber=\"4\" Mandatory=\"Yes\" KeySequence=\"No\" MethodOID=\"MOID\" Role=\"Role\" RoleCodeListOID=\"ROLE_OID\" CollectionExceptionConditionOID=\"CEC_OID\"/>\n</ItemGroupDef>")
  end

  it 'add_alias' do
    document = Nokogiri::XML::Document.new()
    node = Odm::ItemGroupDef.new(document, "ITEM_OID", "Name", "Yes", "", "", "", "", "", "")
    node.add_alias("NCI", "C12345")
    expect(node.to_s).to eq("<ItemGroupDef OID=\"ITEM_OID\" Name=\"Name\" Repeating=\"Yes\">\n  <Alias Context=\"NCI\" Name=\"C12345\"/>\n</ItemGroupDef>")
  end

end