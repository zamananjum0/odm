require 'spec_helper'

describe Odm::Node do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::Node.new("Name", document)
    expect(node.to_s).to eq("<Name/>")
  end

  it 'name' do
    document = Nokogiri::XML::Document.new()
    node = Odm::Node.new("Name", document)
    expect(node.name).to eq("Name")
  end

  it 'add_node' do
    document = Nokogiri::XML::Document.new()
    node = Odm::Node.new("Name", document)
    node1 = Odm::Node.new("After", document)
    node.add_node(node1)
    expect(node.to_s).to eq("<Name>\n  <After/>\n</Name>")
  end

  it 'add_node_after' do
    document = Nokogiri::XML::Document.new()
    node = Odm::Node.new("Name", document)
    node1 = Odm::Node.new("After1", document)
    node2 = Odm::Node.new("After2", document)
    node.add_node(node1)
    node1.add_node_after(node2)
    expect(node.to_s).to eq("<Name>\n  <After1/>\n  <After2/>\n</Name>")
  end

  it 'set_content' do
    document = Nokogiri::XML::Document.new()
    node = Odm::Node.new("Name", document)
    node.set_content("Content")
    expect(node.to_s).to eq("<Name>Content</Name>")
  end

  it 'add_attribute' do
    document = Nokogiri::XML::Document.new()
    node = Odm::Node.new("Name", document)
    node.add_attribute("Attr", "Value")
    expect(node.to_s).to eq("<Name Attr=\"Value\"/>")
  end

  it 'add_default_namespace' do
    document = Nokogiri::XML::Document.new()
    node = Odm::Node.new("Name", document)
    node.add_default_namespace("http://www.example.com")
    expect(node.to_s).to eq("<Name xmlns=\"http://www.example.com\"/>")
  end

  it 'add_namespace(prefix, href)' do
    document = Nokogiri::XML::Document.new()
    node = Odm::Node.new("Name", document)
    node.add_namespace("ex:", "http://www.example.com")
    expect(node.to_s).to eq("<Name xmlns:ex:=\"http://www.example.com\"/>")
  end

  it 'ref' do
    document = Nokogiri::XML::Document.new()
    node = Odm::Node.new("Name", document)
    node.add_attribute("Attr", "Value")
    expect(node.ref.to_s).to eq("<Name Attr=\"Value\"/>")
  end
  
  it 'to_s' do
    document = Nokogiri::XML::Document.new()
    node = Odm::Node.new("Name", document)
    node.add_attribute("Attr1", "Value1")
    node.add_attribute("Attr2", "Value2")
    node.set_content("Element Value")
    expect(node.to_s).to eq("<Name Attr1=\"Value1\" Attr2=\"Value2\">Element Value</Name>")
  end
  
end