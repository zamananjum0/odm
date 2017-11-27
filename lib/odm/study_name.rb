require 'odm/node'

class Odm::StudyName < Odm::Node

	def initialize(document, name)
		super("StudyName", document)
		self.set_content("#{name}")
		return self
	end

end