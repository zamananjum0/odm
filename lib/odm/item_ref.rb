require 'odm/node'

class Odm::ItemRef < Odm::Node

	def initialize(document, item_oid, order_number, mandatory, key_sequence, method_oid, role, role_code_list_oid, cec_oid)
		super("ItemRef", document)
		self.add_attribute("ItemOID", "#{item_oid}")
		self.add_attribute("OrderNumber", "#{order_number}") if !order_number.empty?
		self.add_attribute("Mandatory", "#{mandatory}")
		self.add_attribute("KeySequence", "#{key_sequence}") if !key_sequence.empty?
		self.add_attribute("MethodOID", "#{method_oid}") if !method_oid.empty?
		self.add_attribute("Role", "#{role}") if !role.empty?
		self.add_attribute("RoleCodeListOID", "#{role_code_list_oid}") if !role_code_list_oid.empty?
		self.add_attribute("CollectionExceptionConditionOID", "#{cec_oid}") if !cec_oid.empty?
		return self
	end

end