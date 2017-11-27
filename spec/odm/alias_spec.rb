require 'spec_helper'

describe Odm::Alias do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::Alias.new(document, "Context", "Name")
    expect(node.to_s).to eq("<Alias Context=\"Context\" Name=\"Name\"/>")
  end
  
end