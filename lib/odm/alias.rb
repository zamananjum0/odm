require 'odm/node'

class Odm::Alias < Odm::Node

	def initialize(document, context, name)
		super("Alias", document)
		self.add_attribute("Context", "#{context}")
		self.add_attribute("Name", "#{name}")
		return self
	end

end