#################################################################################
# Class Grammar
# Parses lexemes given by lex and checks to ensure that they form valid "sentences."
#
# Primary method is "sentence()"
#################################################################################
class Grammar
  
  def initialize( lexer )
    @lexer = Lexer.new()
    @currentLexeme = @lexer.lex
    parse
  end
  
  
  def parse

  end
  
end