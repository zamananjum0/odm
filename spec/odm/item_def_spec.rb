require 'spec_helper'

describe Odm::ItemDef do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::ItemDef.new(document, "ITEM_OID", "Name", "integer", "3", "1", "X", "SDSX", "Protocol", "Logic!")
    expect(node.to_s).to eq("<ItemDef OID=\"ITEM_OID\" Name=\"Name\" DataType=\"integer\" Length=\"3\" SignificantDigits=\"1\" SASFieldName=\"X\" SDSVarName=\"SDSX\" Origin=\"Protocol\" Comment=\"Logic!\"/>")
  end

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::ItemDef.new(document, "ITEM_OID", "Name", "integer", "", "", "", "", "", "")
    expect(node.to_s).to eq("<ItemDef OID=\"ITEM_OID\" Name=\"Name\" DataType=\"integer\"/>")
  end

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::ItemDef.new(document, "ITEM_OID", "Name", "integer", "", "", "", "SDSVAR", "", "")
    expect(node.to_s).to eq("<ItemDef OID=\"ITEM_OID\" Name=\"Name\" DataType=\"integer\" SDSVarName=\"SDSVAR\"/>")
  end

  it 'add_description' do
    document = Nokogiri::XML::Document.new()
    node = Odm::ItemDef.new(document, "ITEM_OID", "Name", "integer", "3", "1", "X", "SDSX", "Protocol", "Logic!")
    node.add_description
    expect(node.to_s).to eq("<ItemDef OID=\"ITEM_OID\" Name=\"Name\" DataType=\"integer\" Length=\"3\" SignificantDigits=\"1\" SASFieldName=\"X\" SDSVarName=\"SDSX\" Origin=\"Protocol\" Comment=\"Logic!\">\n  <Description/>\n</ItemDef>")
  end

	it 'add_question' do
    document = Nokogiri::XML::Document.new()
    node = Odm::ItemDef.new(document, "ITEM_OID", "Name", "integer", "3", "1", "X", "SDSX", "Protocol", "Logic!")
    node.add_question
    expect(node.to_s).to eq("<ItemDef OID=\"ITEM_OID\" Name=\"Name\" DataType=\"integer\" Length=\"3\" SignificantDigits=\"1\" SASFieldName=\"X\" SDSVarName=\"SDSX\" Origin=\"Protocol\" Comment=\"Logic!\">\n  <Question/>\n</ItemDef>")
  end

  it 'add_code_list_ref' do
    document = Nokogiri::XML::Document.new()
    node = Odm::ItemDef.new(document, "ITEM_OID", "Name", "integer", "3", "1", "X", "SDSX", "Protocol", "Logic!")
    node.add_code_list_ref("CL_OID")
    expect(node.to_s).to eq("<ItemDef OID=\"ITEM_OID\" Name=\"Name\" DataType=\"integer\" Length=\"3\" SignificantDigits=\"1\" SASFieldName=\"X\" SDSVarName=\"SDSX\" Origin=\"Protocol\" Comment=\"Logic!\">\n  <CodeListRef CodeListOID=\"CL_OID\"/>\n</ItemDef>")
  end

  it 'add_alias' do
    document = Nokogiri::XML::Document.new()
    node = Odm::ItemDef.new(document, "ITEM_OID", "Name", "integer", "3", "1", "X", "SDSX", "Protocol", "Logic!")
    node.add_alias("NCI", "C12345")
    expect(node.to_s).to eq("<ItemDef OID=\"ITEM_OID\" Name=\"Name\" DataType=\"integer\" Length=\"3\" SignificantDigits=\"1\" SASFieldName=\"X\" SDSVarName=\"SDSX\" Origin=\"Protocol\" Comment=\"Logic!\">\n  <Alias Context=\"NCI\" Name=\"C12345\"/>\n</ItemDef>")
  end

end