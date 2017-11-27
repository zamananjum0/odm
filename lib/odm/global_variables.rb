require 'odm/node'
require 'odm/study_name'
require 'odm/study_description'
require 'odm/protocol_name'

class Odm::GlobalVariables < Odm::Node

	def initialize(document)
		super("GlobalVariables", document)
		return self
	end

	def add_study_name(name)
		node = Odm::StudyName.new(@node.document, name)
		self.add_node(node)
		return node
	end

	def add_study_description(description)
		node = Odm::StudyDescription.new(@node.document, description)
		self.add_node(node)
		return node
	end

	def add_protocol_name(name)
		node = Odm::ProtocolName.new(@node.document, name)
		self.add_node(node)
		return node
	end


end