require 'parser/current'

code =<<~CODE
def say(message)
  puts message
end
CODE

node = Parser::CurrentRuby.parse(code)
definition = node.loc
method_begin_pos = definition.keyword.begin_pos
method_end_pos = definition.end.end_pos

puts code[method_begin_pos...method_end_pos]

