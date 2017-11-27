require 'spec_helper'

describe Odm::Question do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::Question.new(document)
    expect(node.to_s).to eq("<Question/>")
  end

  it 'add_translated_text' do
    document = Nokogiri::XML::Document.new()
    node = Odm::Question.new(document)
    node.add_translated_text("text")
    expect(node.to_s).to eq("<Question>\n  <TranslatedText xml:lang=\"en\">text</TranslatedText>\n</Question>")
  end

end