require 'spec_helper'

describe Odm::StudyEventDef do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::StudyEventDef.new(document, "SE_OID", "STUDY A", "Yes", "Type", "CATEGORY")
    expect(node.to_s).to eq("<StudyEventDef OID=\"SE_OID\" Name=\"STUDY A\" Repeating=\"Yes\" Type=\"Type\" Category=\"CATEGORY\"/>")
  end
  
  it 'add_description' do
    document = Nokogiri::XML::Document.new()
    node = Odm::StudyEventDef.new(document, "SE_OID", "STUDY A", "Yes", "Type", "CATEGORY")
    node.add_description
    expect(node.to_s).to eq("<StudyEventDef OID=\"SE_OID\" Name=\"STUDY A\" Repeating=\"Yes\" Type=\"Type\" Category=\"CATEGORY\">\n  <Description/>\n</StudyEventDef>")
  end

  it 'add_form_ref' do
    document = Nokogiri::XML::Document.new()
    node = Odm::StudyEventDef.new(document, "SE_OID", "STUDY A", "Yes", "Type", "CATEGORY")
    node.add_form_ref("FORM_OID", "1", "Yes", "CEC_OID")
    expect(node.to_s).to eq("<StudyEventDef OID=\"SE_OID\" Name=\"STUDY A\" Repeating=\"Yes\" Type=\"Type\" Category=\"CATEGORY\">\n  <FormRef FormOID=\"FORM_OID\" OrderNumber=\"1\" Mandatory=\"Yes\" CollectionExceptionConditionOID=\"CEC_OID\"/>\n</StudyEventDef>")
  end

	it 'add_alias' do
    document = Nokogiri::XML::Document.new()
    node = Odm::StudyEventDef.new(document, "SE_OID", "STUDY A", "Yes", "Type", "CATEGORY")
    node.add_alias("NCI", "C12345")
    expect(node.to_s).to eq("<StudyEventDef OID=\"SE_OID\" Name=\"STUDY A\" Repeating=\"Yes\" Type=\"Type\" Category=\"CATEGORY\">\n  <Alias Context=\"NCI\" Name=\"C12345\"/>\n</StudyEventDef>")
  end

end