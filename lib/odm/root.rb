require 'odm/node'
require 'odm/study'

class Odm::Root < Odm::Node

	C_DEFAULT_NAMEPSPACE = "http://www.cdisc.org/ns/odm/v1.3"
	C_XSI_NAMEPSPACE = "http://www.w3.org/2001/XMLSchema-instance"
	C_XLINK_NAMEPSPACE = "http://www.w3.org/1999/xlink" 
	
	def initialize(document, description, originator, source_system, source_system_version)
		super("ODM", document)
		time = Time.now.strftime("%FT%T%:z")
		self.add_attribute("Description", "#{description}")
		self.add_attribute("FileType", "Snapshot")
		self.add_attribute("Granularity", "Metadata")
		self.add_attribute("FileOID", "#{time}")
		self.add_attribute("ODMVersion", "1.3.2")
		self.add_attribute("Originator", "#{originator}")
		self.add_attribute("SourceSystem", "#{source_system}")
		self.add_attribute("SourceSystemVersion", "#{source_system_version}")
		self.add_attribute("CreationDateTime", "#{time}")
		return self
	end

	def add_namespaces
		self.add_default_namespace(C_DEFAULT_NAMEPSPACE )
		self.add_namespace("xsi", C_XSI_NAMEPSPACE)
		self.add_namespace("xlink", C_XLINK_NAMEPSPACE)
	end

	def add_study(oid)
		node = Odm::Study.new(@node.document, oid)
		self.add_node(node)
		return node
	end

end