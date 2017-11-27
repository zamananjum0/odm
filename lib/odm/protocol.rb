require 'odm/node'
require 'odm/description'
require 'odm/study_event_ref'
require 'odm/alias'

class Odm::Protocol < Odm::Node

	def initialize(document)
		super("Protocol", document)
		return self
	end

	def add_description
		node = Odm::Description.new(@node.document)
		self.add_node(node)
		return node
	end

	def add_study_event_ref(study_event_oid, order_number, mandatory, cec_oid)
		node = Odm::StudyEventRef.new(@node.document, study_event_oid, order_number, mandatory, cec_oid)
		self.add_node(node)
		return node
	end

	def add_alias(context, name)
		node = Odm::Alias.new(@node.document, context, name)
		self.add_node(node)
		return node
	end

end