require './lexer'
require './grammar'

class Main # Controls each of the individual language components
  
  def initialize
    
    puts "In the main; script running!"
    @lexer = Lexer.new()
    @lexer.lex
    #@grammar = Grammar.new( @lexer )
    
  end
  
end

Main.new