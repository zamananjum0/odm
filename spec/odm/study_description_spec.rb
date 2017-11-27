require 'spec_helper'

describe Odm::StudyDescription do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::StudyDescription.new(document, "Name")
    expect(node.to_s).to eq("<StudyDescription>Name</StudyDescription>")
  end
  
end