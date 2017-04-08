# This class takes a typescript interface and converts it to a Ruby struct.
class Interfacer
  attr_accessor :name, :attributes

  def initialize(name, attributes)
    @name = name
    @attributes = attributes
  end

  def self.parse(interface_string)
    iter = interface_string.split(/[\s{}]/).reject(&:empty?).to_enum
    loop { raise StopIteration if iter.next == 'interface' }
    name = iter.peek
    attributes = iter.each_cons(2).map do |token, following|
      next unless following.match?(/;$/)
      optional = token.match?(/\?:$/)
      attr_name = token[0...(optional ? -2 : -1)]
      datatype = following[0...-1]
      InterfaceAttribute.new(attr_name, datatype, optional)
    end.compact
    Interfacer.new(name, attributes)
  end
end

class InterfaceAttribute
  attr_accessor :name, :datatype, :optional

  def initialize(name, datatype, optional)
    @name = name
    @datatype = datatype
    @optional = optional
  end
end
