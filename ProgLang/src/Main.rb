require_relative 'Lexer'
require_relative 'Grammar'

class Main # Controls each of the individual language components
  
  def initialize
    
    $debugMode = true
    
    puts "In the main; script running!"
    Lexer.setText("I am a giant hotdog if then else ( )")

    loop do
      lexeme = Lexer.lex
      if lexeme.type == :ENDOFFILE
        break
      end
    end
    
    #@grammar = Grammar.new( @lexer )
    
  end
  
end

Main.new