require 'odm/node'

class Odm::ProtocolName < Odm::Node

	def initialize(document, name)
		super("ProtocolName", document)
		self.set_content("#{name}")
		return self
	end

end