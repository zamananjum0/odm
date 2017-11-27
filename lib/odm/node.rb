require "nokogiri"

class Odm::Node

  def initialize(name, document)
    @node = Nokogiri::XML::Node.new(name, document)
  end

  def name
  	return @node.name
  end

  def add_node(node)
    @node << node.ref
  end

  def add_node_after(node)
    @node.add_next_sibling(node.ref)
  end

  def set_content(value)
    @node.content = value
  end

  def add_attribute(name, value)
  	@node[name] = value
  end

  def add_default_namespace(href)
    @node.add_namespace_definition(nil, href)
  end

  def add_namespace(prefix, href)
    @node.add_namespace_definition(prefix, href)
  end

  def ref
    return @node
  end

  def to_s
    return @node.to_xml
  end

end