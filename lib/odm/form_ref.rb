require 'odm/node'

class Odm::FormRef < Odm::Node

	def initialize(document, form_oid, order_number, mandatory, cec_oid)
		super("FormRef", document)
		self.add_attribute("FormOID", "#{form_oid}")
		self.add_attribute("OrderNumber", "#{order_number}") if !order_number.empty?
		self.add_attribute("Mandatory", "#{mandatory}")
		self.add_attribute("CollectionExceptionConditionOID", "#{cec_oid}") if !cec_oid.empty?
		return self
	end

end