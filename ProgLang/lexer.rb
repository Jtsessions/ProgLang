require 'strscan'

class Lexer # Class that creates lexemes for each symbol encountered
  
  def initialize( filePath )
    @text = "        define cherry ( chicken sandwich ) { chicken / sandwich }" # This is a placeholder. Grab the file instead!
    @scanner = StringScanner.new( @text )
    lex
  end
  
  def lex
    
    results = [] # Create an array to store the resulting chain of lexemes for return
    
    nextToken = @scanner.scan(/\s*(\w+|[(){}+\-*\/])/) # Match optional whitespace, then a word or parenthesis/bracket
    p nextToken.strip
    until nextToken == nil
    
      type = nil # Initialize type and value fields so that we can factor out the lexeme constructor statement
      value = nil
    
      case nextToken.strip
        when "define"
          type = :DEFINE
        when "("
          type = :OPAREN
        when ")"
          type = :CPAREN
        when "{"
          type = :OBRACKET
        when "}"
          type = :CBRACKET
        when "/"
          type = :FSLASH
        when "\\"
          type = :BSLASH
        when "+"
          type = :PLUS
        when "-"
          type = :MINUS
        when ";"
          type = :SEMICOLON
        when ":"
          type = :COLON
        when "if"
          type = :IF
        when "else"
          type = :ELSE
        else # For now, instead of "token not implemented", we'll say they're identifiers.
          type = :IDENTIFIER
          value = nextToken.strip
      end
      
      results.push( Lexeme.new( type, value ))
    
      nextToken = @scanner.scan(/\s+(\w+|[(){}+\-*\/])/) # Match whitespace, then a word or parenthesis/bracket
    end

    results.each { |x| print "#{x}\n" }
    
  end
  
end