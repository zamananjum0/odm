require 'spec_helper'

describe Odm::StudyName do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::StudyName.new(document, "Study Name")
    expect(node.to_s).to eq("<StudyName>Study Name</StudyName>")
  end
  
end