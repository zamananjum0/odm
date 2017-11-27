require 'odm/node'
require 'odm/global_variables'
require 'odm/metadata_version'

class Odm::Study < Odm::Node

	def initialize(document, oid)
		super("Study", document)
		self.add_attribute("OID", "#{oid}")
		return self
	end

	def add_global_variables
		node = Odm::GlobalVariables.new(@node.document)
		self.add_node(node)
		return node
	end

	def add_metadata_version(oid, name, description)
		node = Odm::MetadataVersion.new(@node.document, oid, name, description)
		self.add_node(node)
		return node
	end

end