class Boolean
  def initialize(value)
    case value
    when FalseClass
      false
    when TrueClass
      true
    else
      raise 'This is not a boolean'
    end
  end
end
