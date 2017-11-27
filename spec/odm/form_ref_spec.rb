require 'spec_helper'

describe Odm::FormRef do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::FormRef.new(document, "FORM_OID", "2", "Yes", "CEC_OID")
    expect(node.to_s).to eq("<FormRef FormOID=\"FORM_OID\" OrderNumber=\"2\" Mandatory=\"Yes\" CollectionExceptionConditionOID=\"CEC_OID\"/>")
  end
  
end