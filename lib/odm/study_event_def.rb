require 'odm/node'
require 'odm/description'
require 'odm/form_ref'
require 'odm/alias'

class Odm::StudyEventDef < Odm::Node

	def initialize(document, oid, name, repeating, type, category)
		super("StudyEventDef", document)
		self.add_attribute("OID", "#{oid}")
		self.add_attribute("Name", "#{name}")
		self.add_attribute("Repeating", "#{repeating}")
		self.add_attribute("Type", "#{type}")
		self.add_attribute("Category", "#{category}") if !category.empty?
		return self
	end

	def add_description
		node = Odm::Description.new(@node.document)
		self.add_node(node)
		return node
	end

	def add_form_ref(form_oid, order_number, mandatory, cec_oid)
		node = Odm::FormRef.new(@node.document, form_oid, order_number, mandatory, cec_oid)
		self.add_node(node)
		return node
	end

	def add_alias(context, name)
		node = Odm::Alias.new(@node.document, context, name)
		self.add_node(node)
		return node
	end

end