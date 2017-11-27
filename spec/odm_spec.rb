require 'spec_helper'
require "support/file_helpers"

describe Odm do
  
  include FileHelpers

  def sub_dir
  	return "lib"
  end

  it 'has a version number' do
    expect(Odm::VERSION).not_to be nil
  end

	it 'builds document' do
    odm = Odm.new("Odm", "assero", "system_name", "system_version")
    expect(Odm.to_s).to eq("Odm")
	end

	it 'provides the root node' do
    odm = Odm.new("Odm", "assero", "system_name", "system_version")
    root = odm.root
  	file_oid = string_between_markers(root.to_s, "FileOID=\"", "\"")
    creation_dt = string_between_markers(root.to_s, "CreationDateTime=\"", "\"")
  #expected = write_text_file(root.to_s, sub_dir, "root_node.txt")
    expected = read_text_file(sub_dir, "root_node.txt")
    expected.gsub!("___OID___", file_oid)
    expected.gsub!("___CREATION___", creation_dt)
    expect(root.to_s).to eq(expected)
	end

	it 'provides xml' do
    odm = Odm.new("Odm", "assero", "system_name", "system_version")
    root = odm.to_xml
  	file_oid = string_between_markers(root.to_s, "FileOID=\"", "\"")
    creation_dt = string_between_markers(root.to_s, "CreationDateTime=\"", "\"")
  #expected = write_text_file(root.to_s, sub_dir, "root_xml.txt")
    expected = read_text_file(sub_dir, "root_xml.txt")
    expected.gsub!("___OID___", file_oid)
    expected.gsub!("___CREATION___", creation_dt)
    expect(root).to eq(expected)
	end

	it 'builds an entire document' do
		odm_document = Odm.new("ODM-Test", "Assero", "Glandon", Odm::VERSION)
    odm = odm_document.root
    study = odm.add_study("S-TEST")
    global_variables = study.add_global_variables()
    global_variables.add_study_name("Form Export Test")
    global_variables.add_study_description("Not applicable. Single form export.")
    global_variables.add_protocol_name("Not applicable. Single form export.")
    metadata_version = study.add_metadata_version("MDV-TEST", "Metadata for test", "Not applicable. Single form export.")
    protocol = metadata_version.add_protocol()
    protocol.add_study_event_ref("SE-TEST", "1", "Yes", "")
    study_event_def = metadata_version.add_study_event_def("SE-TEST", "Not applicable. Single form export.", "No", "Scheduled", "")    
    study_event_def.add_form_ref("FORM1", "1", "Yes", "")
    form_def = metadata_version.add_form_def("FORM1", "Form", "No")
		group_ordinal = 1
    ["GROUP1", "GROUP2", "GROUP3"].each do |group|
    	form_def.add_item_group_ref("#{group}", "#{group_ordinal}", "No", "")
			item_group_def = metadata_version.add_item_group_def(group, group, "No", "", "", "", "", "", "")
    	item_ordinal = 1
    	["ITEM1", "ITEM2", "ITEM3"].each do |item|
    		item_group_def.add_item_ref("#{group}_#{item}", "#{item_ordinal}", "No", "", "", "", "", "")
				item_def = metadata_version.add_item_def("#{group}_#{item}", "#{item}", "integer", "3", "", "", "", "", "")
		    question = item_def.add_question()
    		question.add_translated_text("Question text")
    	  code_list_ref = item_def.add_code_list_ref("#{group}_#{item}_CL")
      	code_list = metadata_version.add_code_list("#{group}_#{item}_CL", "Code list for #{group}_#{item}", "text", "")
      	cl_ordinal = 1
      	["CLI1", "CLI2", "CLI3"].each do |cl|
        	code_list_item = code_list.add_code_list_item("#{group}_#{item}_CL_#{cl}", "", "#{cl_ordinal}")
        	decode = code_list_item.add_decode()
        	decode.add_translated_text("#{cl}_label")
        	cl_ordinal += 1
        end
        item_ordinal += 1
      end
      group_ordinal += 1
    end
    root = odm_document.to_xml
  	file_oid = string_between_markers(root.to_s, "FileOID=\"", "\"")
    creation_dt = string_between_markers(root.to_s, "CreationDateTime=\"", "\"")
  #expected = write_text_file(root.to_s, sub_dir, "odm_1.txt")
    expected = read_text_file(sub_dir, "odm_1.txt")
    expected.gsub!("___OID___", file_oid)
    expected.gsub!("___CREATION___", creation_dt)
    expect(root).to eq(expected)
   end

end
