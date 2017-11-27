require 'odm/node'
require 'odm/description'
require 'odm/question'
require 'odm/code_list_ref'
require 'odm/alias'

class Odm::ItemDef < Odm::Node

	def initialize(document, oid, name, datatype, length, significant_digits, sas_field_name, sds_var_name, origin, comment)
		super("ItemDef", document)
		self.add_attribute("OID", "#{oid}")
		self.add_attribute("Name", "#{name}")
		self.add_attribute("DataType", "#{datatype}")
		self.add_attribute("Length", "#{length}") if !length.empty?
		self.add_attribute("SignificantDigits", "#{significant_digits}") if !significant_digits.empty?
		self.add_attribute("SASFieldName", "#{sas_field_name}") if !sas_field_name.empty?
		self.add_attribute("SDSVarName", "#{sds_var_name}") if !sds_var_name.empty?
		self.add_attribute("Origin", "#{origin}") if !origin.empty?
		self.add_attribute("Comment", "#{comment}") if !comment.empty?
		return self
	end

	def add_description
		node = Odm::Description.new(@node.document)
		self.add_node(node)
		return node
	end

	def add_question()
		node = Odm::Question.new(@node.document)
		self.add_node(node)
		return node
	end

	def add_code_list_ref(code_list_oid)
		node = Odm::CodeListRef.new(@node.document, code_list_oid)
		self.add_node(node)
		return node
	end

	def add_alias(context, name)
		node = Odm::Alias.new(@node.document, context, name)
		self.add_node(node)
		return node
	end

end