require 'spec_helper'

describe Odm::ItemRef do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::ItemRef.new(document, "ITEM_OID", "3", "Yes", "3", "M_OID", "ROLE", "XXX", "CEC_OID")
    expect(node.to_s).to eq("<ItemRef ItemOID=\"ITEM_OID\" OrderNumber=\"3\" Mandatory=\"Yes\" KeySequence=\"3\" MethodOID=\"M_OID\" Role=\"ROLE\" RoleCodeListOID=\"XXX\" CollectionExceptionConditionOID=\"CEC_OID\"/>")
  end
  
end