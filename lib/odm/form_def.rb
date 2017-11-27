require 'odm/node'
require 'odm/description'
require 'odm/item_group_ref'
require 'odm/alias'

class Odm::FormDef < Odm::Node

	def initialize(document, oid, name, repeating)
		super("FormDef", document)
		self.add_attribute("OID", "#{oid}")
		self.add_attribute("Name", "#{name}")
		self.add_attribute("Repeating", "#{repeating}")
		return self
	end

	def add_description
		node = Odm::Description.new(@node.document)
		self.add_node(node)
		return node
	end

	def add_item_group_ref(item_group_oid, order_number, mandatory, cec_oid)
		node = Odm::ItemGroupRef.new(@node.document, item_group_oid, order_number, mandatory, cec_oid)
		self.add_node(node)
		return node
	end

	def add_alias(context, name)
		node = Odm::Alias.new(@node.document, context, name)
		self.add_node(node)
		return node
	end

end