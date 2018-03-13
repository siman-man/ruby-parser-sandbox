require 'parser/current'

code =<<~CODE
class A
  def initialize(name)
    @name = name
  end

  def say(message)
    puts message
  end
end
CODE

def traverse(node)
  puts "Node type: #{node.type}"

  node.children.select { |n| n.instance_of?(Parser::AST::Node) }.each do |child|
    traverse(child)
  end
end

node = Parser::CurrentRuby.parse(code)
pp node
traverse(node)

