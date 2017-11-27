require 'odm/node'
require 'odm/protocol'
require 'odm/study_event_def'
require 'odm/form_def'
require 'odm/item_group_def'
require 'odm/item_def'
require 'odm/code_list'

class Odm::MetadataVersion < Odm::Node

	C_CLASS_NAME = "Odm::MetadataVersion"

	def initialize(document, oid, name, description)
		super("MetaDataVersion", document)
		self.add_attribute("OID", "#{oid}")
		self.add_attribute("Name", "#{name}")
		self.add_attribute("Description", "#{description}")
		return self
	end

	def add_protocol
		node = Odm::Protocol.new(@node.document)
		self.add_node(node)
		return node
	end

	def add_study_event_def(oid, name, repeating, type, category)
		node = Odm::StudyEventDef.new(@node.document, oid, name, repeating, type, category)
		self.add_node(node)
		return node
	end

	def add_form_def(oid, name, repeating)
		node = Odm::FormDef.new(@node.document, oid, name, repeating)
		add_at(node, "FormDef", "StudyEventDef")
		return node
	end

	def add_item_group_def(oid, name, repeating, is_reference_data, sas_dataset_name, domain, origin, purpose, comment)
		node = Odm::ItemGroupDef.new(@node.document, oid, name, repeating, is_reference_data, sas_dataset_name, domain, origin, purpose, comment)
		add_at(node, "ItemGroupDef", "FormDef")
		return node
	end

	def add_item_def(oid, name, datatype, length, significant_digits, sas_field_name, sds_var_name, origin, comment)
		node = Odm::ItemDef.new(@node.document, oid, name, datatype, length, significant_digits, sas_field_name, sds_var_name, origin, comment)
		add_at(node, "ItemDef", "ItemGroupDef")
		return node
	end

	def add_code_list(oid, name, datatype, sas_format_name)
		node = Odm::CodeList.new(@node.document, oid, name, datatype, sas_format_name)
		add_at(node, "CodeList", "ItemDef")
		return node
	end

private

	def add_at(node, this_element, previous_element)
		node_set = self.ref.xpath("#{this_element}[last()]")
		if node_set.length > 0
			position_node = node_set.last
			position_node.add_next_sibling(node.ref)
		else
			node_set = self.ref.xpath("#{previous_element}[last()]")
			if node_set.length > 0
				position_node = node_set.last
				position_node.add_next_sibling(node.ref)
			else
				self.add_node(node)
			end
		end
	end
end