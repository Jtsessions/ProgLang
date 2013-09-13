class Lexeme # Class that represents a lexed token

  attr_reader :type
  attr_reader :value
  
  def initialize(type, value)
    @type = type
    @value = value
  end
  
end