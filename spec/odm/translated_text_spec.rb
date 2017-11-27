require 'spec_helper'

describe Odm::TranslatedText do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::TranslatedText.new(document, "Content")
    expect(node.to_s).to eq("<TranslatedText xml:lang=\"en\">Content</TranslatedText>")
  end
  
end