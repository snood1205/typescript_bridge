# This class takes a typescript interface and converts it to a Ruby struct.
class Interfacer
  attr_accessor :name, :attributes

  def initialize(name, attributes)
    @name = name
    @attributes = attributes
  end

  class << self
    def parse(interface_string)
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

  def to_struct
    attribute_names = attributes.map(&:sym_name)
    Struct.new(attribute_names) do
      def initialize(options = {})
        required_attr = attributes.reject(&:optional).map(&:sym_name)
        validity_array = options.keys - required_attr
        raise "Missing attribute #{validity_array[0]}" if validity_array.length == 1
        raise "Missing attributes #{validity_array.map(&:to_s).join(', ')}" if validity_array.length > 1
      end
    end
  end
end
end

class InterfaceAttribute
  attr_accessor :name, :datatype, :optional

  def initialize(name, datatype, optional)
    @name = name
    @datatype = datatype
    @optional = optional
  end

  def sym_name
    name.to_sym
  end
end
