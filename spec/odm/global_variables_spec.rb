require 'spec_helper'

describe Odm::GlobalVariables do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::GlobalVariables.new(document)
    expect(node.to_s).to eq("<GlobalVariables/>")
  end

  it 'add_study_name' do
    document = Nokogiri::XML::Document.new()
    node = Odm::GlobalVariables.new(document)
    node.add_study_name("Name")
    expect(node.to_s).to eq("<GlobalVariables>\n  <StudyName>Name</StudyName>\n</GlobalVariables>")
  end

	it 'add_study_desciption' do
    document = Nokogiri::XML::Document.new()
    node = Odm::GlobalVariables.new(document)
    node.add_study_description("Description")
    expect(node.to_s).to eq("<GlobalVariables>\n  <StudyDescription>Description</StudyDescription>\n</GlobalVariables>")
  end

  it 'add_protocol_name' do
    document = Nokogiri::XML::Document.new()
    node = Odm::GlobalVariables.new(document)
    node.add_protocol_name("Name")
    expect(node.to_s).to eq("<GlobalVariables>\n  <ProtocolName>Name</ProtocolName>\n</GlobalVariables>")
  end

end