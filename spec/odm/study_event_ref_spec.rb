require 'spec_helper'

describe Odm::StudyEventRef do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::StudyEventRef.new(document, "SE_OID", "14", "Yes", "CEC-OID")
    expect(node.to_s).to eq("<StudyEventRef StudyEventOID=\"SE_OID\" OrderNumber=\"14\" Mandatory=\"Yes\" CollectionExceptionConditionOID=\"CEC-OID\"/>")
  end
  
end