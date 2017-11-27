require 'odm/node'
require 'odm/description'
require 'odm/code_list_item'
require 'odm/alias'

class Odm::CodeList < Odm::Node

	def initialize(document, oid, name, datatype, sas_format_name)
		super("CodeList", document)
		self.add_attribute("OID", "#{oid}")
		self.add_attribute("Name", "#{name}")
		self.add_attribute("DataType", "#{datatype}")
		self.add_attribute("SASFormatName", "#{sas_format_name}") if !sas_format_name.empty?
		return self
	end

	def add_description
		node = Odm::Description.new(@node.document)
		self.add_node(node)
		return node
	end

	def add_code_list_item(coded_value, rank, order_number)
		node = Odm::CodeListItem.new(@node.document, coded_value, rank, order_number)
		self.add_node(node)
		return node
	end

	def add_alias(context, name)
		node = Odm::Alias.new(@node.document, context, name)
		self.add_node(node)
		return node
	end

end