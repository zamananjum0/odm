require 'odm/node'

class Odm::ItemGroupRef < Odm::Node

	def initialize(document, item_group_oid, order_number, mandatory, cec_oid)
		super("ItemGroupRef", document)
		self.add_attribute("ItemGroupOID", "#{item_group_oid}")
		self.add_attribute("OrderNumber", "#{order_number}") if !order_number.empty?
		self.add_attribute("Mandatory", "#{mandatory}")
		self.add_attribute("CollectionExceptionConditionOID", "#{cec_oid}") if !cec_oid.empty?
		return self
	end

end