require 'spec_helper'

describe Odm::Protocol do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::Protocol.new(document)
    expect(node.to_s).to eq("<Protocol/>")
  end

  it 'add_description' do
    document = Nokogiri::XML::Document.new()
    node = Odm::Protocol.new(document)
    node.add_description
    expect(node.to_s).to eq("<Protocol>\n  <Description/>\n</Protocol>")
  end

	it 'add_study_event_ref' do
    document = Nokogiri::XML::Document.new()
    node = Odm::Protocol.new(document)
    node.add_study_event_ref("SER_OID", "4", "Yes", "CEC_OID")
    expect(node.to_s).to eq("<Protocol>\n  <StudyEventRef StudyEventOID=\"SER_OID\" OrderNumber=\"4\" Mandatory=\"Yes\" CollectionExceptionConditionOID=\"CEC_OID\"/>\n</Protocol>")
  end

  it 'add_alias' do
    document = Nokogiri::XML::Document.new()
    node = Odm::Protocol.new(document)
    node.add_alias("NCI", "C12345")
    expect(node.to_s).to eq("<Protocol>\n  <Alias Context=\"NCI\" Name=\"C12345\"/>\n</Protocol>")
  end

end