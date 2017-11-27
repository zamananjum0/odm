require 'odm/node'
require 'odm/description'
require 'odm/item_ref'
require 'odm/alias'

class Odm::ItemGroupDef < Odm::Node

	def initialize(document, oid, name, repeating, is_reference_data, sas_dataset_name, domain, origin, purpose, comment)
		super("ItemGroupDef", document)
		self.add_attribute("OID", "#{oid}")
		self.add_attribute("Name", "#{name}")
		self.add_attribute("Repeating", "#{repeating}")
		self.add_attribute("IsReferenceData", "#{is_reference_data}") if !is_reference_data.empty?
		self.add_attribute("SASDatasetName", "#{sas_dataset_name}") if !sas_dataset_name.empty?
		self.add_attribute("Domain", "#{domain}") if !domain.empty?
		self.add_attribute("Origin", "#{origin}") if !origin.empty?
		self.add_attribute("Purpose", "#{purpose}") if !purpose.empty?
		self.add_attribute("Comment", "#{comment}") if !comment.empty?
		return self
	end

	def add_description
		node = Odm::Description.new(@node.document)
		self.add_node(node)
		return node
	end

	def add_item_ref(item_group_oid, order_number, mandatory, key_sequence, method_oid, role, role_code_list_oid, cec_oid)
		node = Odm::ItemRef.new(@node.document, item_group_oid, order_number, mandatory, key_sequence, method_oid, role, role_code_list_oid, cec_oid)
		self.add_node(node)
		return node
	end

	def add_alias(context, name)
		node = Odm::Alias.new(@node.document, context, name)
		self.add_node(node)
		return node
	end

end