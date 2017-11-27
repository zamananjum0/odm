require 'spec_helper'

describe Odm::Decode do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::Decode.new(document)
    expect(node.to_s).to eq("<Decode/>")
  end

	it 'add_translated_text' do
    document = Nokogiri::XML::Document.new()
    node = Odm::Decode.new(document)
    node.add_translated_text("text")
    expect(node.to_s).to eq("<Decode>\n  <TranslatedText xml:lang=\"en\">text</TranslatedText>\n</Decode>")
  end

end