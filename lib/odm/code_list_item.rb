require 'odm/node'
require 'odm/decode'
require 'odm/alias'

class Odm::CodeListItem < Odm::Node

	def initialize(document, coded_value, rank, order_number)
		super("CodeListItem", document)
		self.add_attribute("CodedValue", "#{coded_value}")
		self.add_attribute("Rank", "#{rank}") if !rank.empty?
		self.add_attribute("OrderNumber", "#{order_number}") if !order_number.empty?
		return self
	end

	def add_decode
		node = Odm::Decode.new(@node.document)
		self.add_node(node)
		return node
	end

	def add_alias(context, name)
		node = Odm::Alias.new(@node.document, context, name)
		self.add_node(node)
		return node
	end

end