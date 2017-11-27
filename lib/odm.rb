require "odm/version"
require 'odm/root'
require "nokogiri"

class Odm

	def initialize(description, org, system_name, system_version)
		@document = Nokogiri::XML::Document.new()
		@odm_node = Odm::Root.new(@document, description, org, system_name, system_version)
		return self
	end

	def root
		return @odm_node
	end

	def to_xml
		@odm_node.add_namespaces
		return @document.to_xml + @odm_node.ref.to_xml
	end

end
