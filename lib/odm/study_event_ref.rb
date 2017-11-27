require 'odm/node'

class Odm::StudyEventRef < Odm::Node

	def initialize(document, study_event_oid, order_number, mandatory, cec_oid)
		super("StudyEventRef", document)
		self.add_attribute("StudyEventOID", "#{study_event_oid}")
		self.add_attribute("OrderNumber", "#{order_number}") if !order_number.empty?
		self.add_attribute("Mandatory", "#{mandatory}")
		self.add_attribute("CollectionExceptionConditionOID", "#{cec_oid}") if !cec_oid.empty?
		return self
	end

end