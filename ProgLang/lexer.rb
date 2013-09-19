require 'strscan'

class Lexer # Class that creates lexemes for each symbol encountered
  
  def initialize( filePath )
    @text = " ] [ house ] define 1define define1 cakemix _dog 849894usi jahd@      define cherry ( chicken sandwich ) { 5chicken + chicken / 4255ff - 42 + \"Cake\" - 'Cake' + '    cake' + \"    cake\" + \"cake   \" + 'cake   ' }" # This is a placeholder. Grab the file instead!
    @scanner = StringScanner.new( @text )
    lex
  end

  
  
###################################################################################################################################
# def lex
#   purpose: 
#     Lex parses a source code file for each token and pairs it with a type, then bundles it as a lexeme object.
#     Lex then adds this to a collection of lexemes and returns them all at the end of the process.
#   inputs:
#     None.  
#   outputs:
#     results - an array of lexeme objects taken from the parsing of a file and assignment to a type
###################################################################################################################################
  def lex
    
    results = [] # Create an array to store the resulting chain of lexemes for return
    
    nextToken = @scanner.scan(/\s*\S+/) # Match optional whitespace, then a word or parenthesis/bracket
    until nextToken == nil
    
      type = nil # Initialize type and value fields so that we can factor out the lexeme constructor statement
      value = nil
    
      case nextToken.strip.downcase
        when 'define'
          type = :DEFINE
        when '('
          type = :OPAREN
        when ')'
          type = :CPAREN
        when '{'
          type = :OBRACE
        when '}'
          type = :CBRACE
        when '['
          type = :OBRACKET
        when ']'
          type = :CBRACKET
        when '/'
          type = :FSLASH
        when '\\'
          type = :BSLASH
        when '+'
          type = :PLUS
        when '++'
          type = :PLUSPLUS
        when '-'
          type = :MINUS
        when '--'
          type = :MINUSMINUS
        when ';'
          type = :SEMICOLON
        when ':'
          type = :COLON
        when 'if'
          type = :IF
        when 'else'
          type = :ELSE
        else # If the token isn't "simple"
          if nextToken.strip.match(/^\d+$/)
            type = :INTEGER
            value = nextToken.strip
            
          elsif nextToken.strip[0] == '"' # Instead, when you find an open quote, take the next token until
            type = :DSTRING
            value = obtainStringValue( '"', nextToken.strip )
            
          elsif nextToken.strip[0] == "'" # We find a close quote. If we don't, error!
            type = :SSTRING
            value = obtainStringValue( "'", nextToken.strip )
            
          elsif nextToken.strip.match(/^[a-zA-Z]\w*$/) # Match any identifier starting with a letter
            type = :IDENTIFIER
            value = nextToken.strip
            
          else
            type = :INVALIDTOKEN
            value = "!!!INVALID: |#{nextToken}|!!!"
            
          end
      end
      
      results.push( Lexeme.new( type, value ))
    
      nextToken = @scanner.scan(/\s+\S+/) # Match whitespace, then a word or parenthesis/bracket
      
    end

    results.each { |x| print "#{x}\n" }
    
  end
  
  private
  
###################################################################################################################################
# def obtainStringValue( mode, token )
#   purpose: 
#     handles the cases where strings contain leading spaces as well as when they don't for both single and double quoted strings.
#     Returns the value of the string so that we can create a lexeme.
#   inputs:
#     quotationType - the type of string whose value we're looking to find. Can be " or '.
#     token - the leading character of the string. We can use this to determine if the string has leading spaces.
#   outputs:
#     value - the value of the string begun by token. This will become the value of the string lexeme eventually.
###################################################################################################################################
  def obtainStringValue( quotationType, token )
    if (token.length > 1) and (token[-1] == quotationType) # If the string is a "simple string" with no leading/trailing whitespace
      return token[1...-1]    
    else # The string has leading/trailing whitespace and additional scanning must be done
      nextToken = token + @scanner.scan(/.*?#{quotationType}/) # Here's the bug - If the first token that we get is something like "cake, then we end up throwing out anything stuck to the quotes.
      return nextToken[1...-1]
    end
  end
  
end