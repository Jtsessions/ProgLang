require_relative '../src/lexer'
require_relative '../src/grammar'
require 'test/unit'

class LanguageUnitTest < Test::Unit::TestCase
  
  def testLexer # Test the lexer's ability to properly identify symbols.
    
    setup
    
#    assert_instance_of( Lexer, @lexer )
    
    symbolsToTest = [:OPAREN , :CPAREN ,
                     :OBRACE , :CBRACE ,
                     :OBRACKET , :CBRACKET ,
                     :FSLASH , :BSLASH ,
                     :PLUS , :PLUSPLUS ,
                     :MINUS , :MINUSMINUS ,
                     :SEMICOLON , :COLON ,
                     :IF , :ELSE ,
                     :INTEGER , :INVALIDTOKEN ,
                     :DSTRING , :SSTRING ,
                     :IDENTIFIER ,
                     :INVALIDTOKEN ,
                     :ENDOFFILE ]
    
    symbolsToTest.each do |symbol|
      lexedValue = Lexer.lex
      p lexedValue
      assert_equal( symbol, lexedValue.type )
    end
    
  end

  def setup # Sets up the state that the program will execute in for unit testing.
    Lexer.setText(" ( ) { } [ ] / \\ + ++ - -- ; : if else 5 5j \"dstring\" 'sstring' variable 4variable")
  end

end
