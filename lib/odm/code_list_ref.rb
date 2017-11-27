require 'odm/node'

class Odm::CodeListRef < Odm::Node

	def initialize(document, code_list_oid)
		super("CodeListRef", document)
		self.add_attribute("CodeListOID", "#{code_list_oid}")
		return self
	end

end