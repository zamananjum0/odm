require 'spec_helper'

describe Odm::Description do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::Description.new(document)
    expect(node.to_s).to eq("<Description/>")
  end

	it 'add_translated_text' do
    document = Nokogiri::XML::Document.new()
    node = Odm::Description.new(document)
    node.add_translated_text("text")
    expect(node.to_s).to eq("<Description>\n  <TranslatedText xml:lang=\"en\">text</TranslatedText>\n</Description>")
  end

end