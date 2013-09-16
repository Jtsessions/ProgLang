require './lexeme'
require './lexer'

class Main # Controls each of the individual language components
  
  def initialize
    
    puts "In the main; script running!"
    @lexer = Lexer.new("Insert absolute path here")
    
  end
  
end

Main.new