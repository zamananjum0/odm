require 'spec_helper'

describe Odm::MetadataVersion do

  it 'initialize' do
    document = Nokogiri::XML::Document.new()
    node = Odm::MetadataVersion.new(document, "OID", "Name", "Desciption")
    expect(node.to_s).to eq("<MetaDataVersion OID=\"OID\" Name=\"Name\" Description=\"Desciption\"/>")
  end

  it 'add_protcol' do
    document = Nokogiri::XML::Document.new()
    node = Odm::MetadataVersion.new(document, "OID", "Name", "Desciption")
    node.add_protocol
    expect(node.to_s).to eq("<MetaDataVersion OID=\"OID\" Name=\"Name\" Description=\"Desciption\">\n  <Protocol/>\n</MetaDataVersion>")
  end

	it 'add_study_event_def' do
    document = Nokogiri::XML::Document.new()
    node = Odm::MetadataVersion.new(document, "OID", "Name", "Desciption")
    node.add_study_event_def("OID", "Name", "Yes", "REPEATING", "CAT")
    expect(node.to_s).to eq("<MetaDataVersion OID=\"OID\" Name=\"Name\" Description=\"Desciption\">\n  <StudyEventDef OID=\"OID\" Name=\"Name\" Repeating=\"Yes\" Type=\"REPEATING\" Category=\"CAT\"/>\n</MetaDataVersion>")
  end

  it 'add_form_def' do
    document = Nokogiri::XML::Document.new()
    node = Odm::MetadataVersion.new(document, "OID", "Name", "Desciption")
    node.add_form_def("OID", "Name", "Yes")
    expect(node.to_s).to eq("<MetaDataVersion OID=\"OID\" Name=\"Name\" Description=\"Desciption\">\n  <FormDef OID=\"OID\" Name=\"Name\" Repeating=\"Yes\"/>\n</MetaDataVersion>")
  end

  it 'add_item_group_def' do
    document = Nokogiri::XML::Document.new()
    node = Odm::MetadataVersion.new(document, "OID", "Name", "Desciption")
    node.add_item_group_def("OID", "IGD", "No", "No", "SAS", "Domain", "Origin", "Purpose", "Comment")
    expect(node.to_s).to eq("<MetaDataVersion OID=\"OID\" Name=\"Name\" Description=\"Desciption\">\n  <ItemGroupDef OID=\"OID\" Name=\"IGD\" Repeating=\"No\" IsReferenceData=\"No\" SASDatasetName=\"SAS\" Domain=\"Domain\" Origin=\"Origin\" Purpose=\"Purpose\" Comment=\"Comment\"/>\n</MetaDataVersion>")
  end

  it 'add_item_def' do
    document = Nokogiri::XML::Document.new()
    node = Odm::MetadataVersion.new(document, "OID", "Name", "Desciption")
    node.add_item_def("OID", "ID", "integer", "1", "", "", "SDSVAR", "", "Comment")
    expect(node.to_s).to eq("<MetaDataVersion OID=\"OID\" Name=\"Name\" Description=\"Desciption\">\n  <ItemDef OID=\"OID\" Name=\"ID\" DataType=\"integer\" Length=\"1\" SDSVarName=\"SDSVAR\" Comment=\"Comment\"/>\n</MetaDataVersion>")
  end

  it 'add_code_list' do
    document = Nokogiri::XML::Document.new()
    node = Odm::MetadataVersion.new(document, "OID", "Name", "Desciption")
    node.add_code_list("OID", "ID", "integer", "SAS_FORMAT")
    expect(node.to_s).to eq("<MetaDataVersion OID=\"OID\" Name=\"Name\" Description=\"Desciption\">\n  <CodeList OID=\"OID\" Name=\"ID\" DataType=\"integer\" SASFormatName=\"SAS_FORMAT\"/>\n</MetaDataVersion>")
  end

end