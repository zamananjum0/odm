require 'odm/node'
require 'odm/translated_text'

class Odm::Question < Odm::Node

	def initialize(document)
		super("Question", document)
		return self
	end

	def add_translated_text(text)
		node = Odm::TranslatedText.new(@node.document, text)
		self.add_node(node)
		return node
	end

end