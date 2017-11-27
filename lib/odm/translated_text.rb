require 'odm/node'

class Odm::TranslatedText < Odm::Node

	def initialize(document, name)
		super("TranslatedText", document)
		self.add_attribute("xml:lang", "en")
		self.set_content("#{name}")
		return self
	end

end