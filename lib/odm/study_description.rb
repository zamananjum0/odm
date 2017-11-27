require 'odm/node'

class Odm::StudyDescription < Odm::Node

	def initialize(document, name)
		super("StudyDescription", document)
		self.set_content("#{name}")
		return self
	end

end