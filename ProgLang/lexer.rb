require 'strscan'

class Lexer # Class that creates lexemes for each symbol encountered
  
  def initialize( filePath )
    @text = "        define cherry ( chicken sandwich ) { chicken / sandwich }" # This is a placeholder. Grab the file instead!
    @scanner = StringScanner.new( @text )
    lex
  end
  
  def lex
    
    nextToken = @scanner.scan(/\s*(\w+|[(){}+\-*\/])/) # Match optional whitespace, then a word or parenthesis/bracket
    p nextToken.strip
    until nextToken == nil
      if nextToken.strip == "define"
        p "new Lexeme(function)"
      elsif nextToken.strip == "("
        p "new Lexeme(OPAREN)"
      else
        p "Some other lexeme"
      end
      nextToken = @scanner.scan(/\s+(\w+|[(){}+\-*\/])/) # Match whitespace, then a word or parenthesis/bracket
      p nextToken.strip unless nextToken == nil
    end
    p "EOF"
    
  end
  
end